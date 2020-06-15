view: listing {
  sql_table_name: "DBT_MODELS"."LISTING"
    ;;
  drill_fields: [listing_id]

  dimension: listing_id {
    primary_key: yes
    type: string
    description: "The primary identifier for an individual listing"
    sql: ${TABLE}."LISTING_ID" ;;
  }

  dimension: city {
    type: string
    description: "City location of respective listing"
    sql: ${TABLE}."CITY" ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}."COUNTRY" ;;
  }

  dimension: country_code {
    type: string
    sql: ${TABLE}."COUNTRY_CODE" ;;
  }

  dimension: host_id {
    type: string
    sql: ${TABLE}."HOST_ID" ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}."LATITUDE" ;;
  }

  dimension: listing_name {
    type: string
    sql: ${TABLE}."LISTING_NAME" ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}."LONGITUDE" ;;
  }

  dimension: market {
    type: string
    sql: ${TABLE}."MARKET" ;;
  }

  dimension_group: model_runtime {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."MODEL_RUNTIME" ;;
  }

  dimension: neighborhood {
    type: string
    sql: ${TABLE}."NEIGHBORHOOD" ;;
  }

  dimension_group: snapshot_date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."SNAPSHOT_DATE" ;;
  }

  dimension: state_code {
    type: string
    sql: ${TABLE}."STATE" ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}."STREET" ;;
  }

  dimension: zip_code {
    type: zipcode
    sql: ${TABLE}."ZIPCODE" ;;
  }

  measure: count {
    type: count
    drill_fields: [listing_id, listing_name]
  }
}
