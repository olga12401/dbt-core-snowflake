---
- dashboard: olist
  title: Olist
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: ZvOPgYJc7g1VEuzD56Isyg
  elements:
  - title: " Orders Map"
    name: " Orders Map"
    model: snowflake_model_oly
    explore: fct_orders
    type: looker_geo_coordinates
    fields: [dim_customers.customer_zip_code_prefix, total_orders]
    filters: {}
    sorts: [total_orders desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - measure: average_of_unit_price
      based_on: fct_orders.unit_price
      expression: ''
      label: Average of Unit Price
      type: average
      _kind_hint: measure
      _type_hint: number
    - category: measure
      expression: ''
      label: Total Amount
      based_on: fct_orders.total_order_item
      _kind_hint: measure
      measure: total_amount
      type: sum
      _type_hint: number
      filters: {}
    - category: measure
      expression: ''
      label: Total Orders
      based_on: fct_orders.order_id
      _kind_hint: measure
      measure: total_orders
      type: count_distinct
      _type_hint: number
    map: usa
    map_projection: ''
    show_view_names: false
    point_color: ''
    defaults_version: 1
    hidden_pivots: {}
    quantize_colors: false
    listen:
      Order Created Year: fct_orders.order_created_year
      Category Name: dim_products.category_name_eng
    row: 0
    col: 12
    width: 12
    height: 11
  - title: Total Sale Amount
    name: Total Sale Amount
    model: snowflake_model_oly
    explore: fct_orders
    type: single_value
    fields: [total_sale_amount]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: Total Sale Amount
      value_format:
      value_format_name: decimal_0
      based_on: fct_orders.total_order_item
      _kind_hint: measure
      measure: total_sale_amount
      type: sum
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    defaults_version: 1
    listen:
      Order Created Year: fct_orders.order_created_year
      Category Name: dim_products.category_name_eng
    row: 0
    col: 0
    width: 4
    height: 2
  - title: Toral Orders
    name: Toral Orders
    model: snowflake_model_oly
    explore: fct_orders
    type: single_value
    fields: [total_orders]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: Total Orders
      value_format:
      value_format_name:
      based_on: fct_orders.order_id
      _kind_hint: measure
      measure: total_orders
      type: count_distinct
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    defaults_version: 1
    listen:
      Order Created Year: fct_orders.order_created_year
      Category Name: dim_products.category_name_eng
    row: 0
    col: 4
    width: 4
    height: 2
  - title: Avg lead time days
    name: Avg lead time days
    model: snowflake_model_oly
    explore: fct_orders
    type: single_value
    fields: [avg_lead_time_days]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: Avg lead time days
      value_format:
      value_format_name: decimal_1
      based_on: fct_orders.lead_time_days
      _kind_hint: measure
      measure: avg_lead_time_days
      type: average
      _type_hint: number
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#1f3e5a"
    defaults_version: 1
    listen:
      Order Created Year: fct_orders.order_created_year
      Category Name: dim_products.category_name_eng
    row: 0
    col: 8
    width: 4
    height: 2
  - title: Total Sales Amount by Categoty
    name: Total Sales Amount by Categoty
    model: snowflake_model_oly
    explore: fct_orders
    type: looker_grid
    fields: [dim_products.category_name_eng, total_sale_amount]
    filters: {}
    sorts: [total_sale_amount desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: Total Sale Amount
      value_format:
      value_format_name:
      based_on: fct_orders.total_order_item
      _kind_hint: measure
      measure: total_sale_amount
      type: sum
      _type_hint: number
    - category: table_calculation
      label: Percent of  Total Sale Amount
      value_format:
      value_format_name: percent_2
      calculation_type: percent_of_column_sum
      table_calculation: percent_of_total_sale_amount
      args:
      - total_sale_amount
      _kind_hint: measure
      _type_hint: number
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: true
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_cell_visualizations:
      total_sale_amount:
        is_active: true
        palette:
          palette_id: ce9d3f72-e7c7-cbe0-88a4-b343ea10170a
          collection_id: legacy
          custom_colors:
          - "#ffffff"
          - "#62bad4"
        value_display: true
      percent_of_total_sale_amount:
        is_active: true
        palette:
          palette_id: 791156f3-a439-97c9-7066-775a2246cbec
          collection_id: legacy
          custom_colors:
          - "#ffffff"
          - "#cee0a0"
        value_display: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: ''
    series_value_format:
      total_sale_amount:
        name: decimal_0
        decimals: '0'
        format_string: "#,##0"
        label: Decimals (0)
        label_prefix: Decimals
      percent_of_total_sale_amount:
        name: percent_2
        decimals: '2'
        format_string: "#,##0.00%"
        label: Percent (2)
        label_prefix: Percent
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: bottom, series: [{axisId: total_sale_amount,
            id: total_sale_amount, name: Total Sale Amount}], showLabels: false, showValues: true,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    x_axis_zoom: true
    y_axis_zoom: true
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Order Created Year: fct_orders.order_created_year
      Category Name: dim_products.category_name_eng
    row: 6
    col: 0
    width: 12
    height: 5
  - title: Total Sales Amount by Month
    name: Total Sales Amount by Month
    model: snowflake_model_oly
    explore: fct_orders
    type: looker_column
    fields: [fct_orders.order_created_month, total_sale_amount]
    fill_fields: [fct_orders.order_created_month]
    filters: {}
    sorts: [fct_orders.order_created_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: measure
      expression:
      label: Total Sale Amount
      value_format:
      value_format_name:
      based_on: fct_orders.total_order_item
      _kind_hint: measure
      measure: total_sale_amount
      type: sum
      _type_hint: number
    x_axis_gridlines: true
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: total_sale_amount, id: total_sale_amount,
            name: Total Sale Amount}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_colors:
      total_sale_amount: "#62bad4"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Order Created Year: fct_orders.order_created_year
    row: 2
    col: 0
    width: 12
    height: 4
  filters:
  - name: Order Created Year
    title: Order Created Year
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: snowflake_model_oly
    explore: fct_orders
    listens_to_filters: []
    field: fct_orders.order_created_year
  - name: Category Name
    title: Category Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: snowflake_model_oly
    explore: fct_orders
    listens_to_filters: []
    field: dim_products.category_name_eng
