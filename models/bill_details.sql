{{ config(materialized='view') }}

SELECT
    b.customer_id,
    b.billing_month,
    b.billing_type,
    b.consumption_kwh,
    b.tariff_rate,
    b.energy_charges,
    b.vat,
    b.billed_amount,
    b.net_arrears,
    b.outstanding_amount,

    c.customer_name,
    c.address,
    c.customer_phone,
    c.customer_type,
    c.transformer_id,
    c.account_status,

    t.transformer_name,

    f.feeder_name,

    su.service_unit_name,

    d.district_name,

    r.region_name,

    bnd.band_name,

    sr.sales_rep_name

FROM billing_records

LEFT JOIN customers c
ON b.customer_id = c.customer_id

LEFT JOIN transformer t
ON c.transformer_id = t.transformer_id

LEFT JOIN feeders f
ON t.feeder_id = f.feeder_id

LEFT JOIN service_units su
ON f.service_unit_id = su.service_unit_id

LEFT JOIN districts d
ON su.district_id = d.district_id

LEFT JOIN regions r
ON d.region_id = r.region_id

LEFT JOIN band_tariff bnd
ON f.band_id = bnd.band_id

LEFT JOIN sales_reps sr
ON t.sales_rep_id = sr.sales_rep_id

