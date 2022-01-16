{% snapshot base_snapshot %}

{{
    config(
        strategy='check',
        target_schema='radwarehouse',
        check_cols=['text', 'comment', 'deleted'],
        unique_key='id',
        invalidate_hard_deletes=True
    )
}}

SELECT * FROM {{ source('staging', 'base') }}

{% endsnapshot %}