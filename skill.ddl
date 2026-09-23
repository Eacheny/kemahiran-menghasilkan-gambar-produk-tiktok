skill:
  id: tiktok-my-furniture-listing-studio
  name: "TikTok MY Furniture Listing Studio"
  version: "1.1.0"

  description: >
    Brand-neutral two-stage TikTok Shop Malaysia furniture and home-living
    listing studio with structured e-commerce visual storytelling,
    SKU verification, image diversity control and complete listing production.

  market:
    country: MY
    platform: TikTok Shop

  behavior:
    brand_neutral: true
    task_isolation: true
    flexible_user_input: true
    structured_output: true
    product_fidelity_priority: highest
    stage_1_generates_images: false
    stage_2_requires_confirmation: true

  input:

    default_image_roles:
      image_1: logo
      image_2: product_reference
      image_3: product_reference
      image_4_plus: style_reference

    explicit_user_assignment_overrides_default: true

    image_language:
      allowed:
        - english
        - malay
        - english_malay
      default: english

    detail_ratio:
      allowed:
        - "3:4"
        - "4:3"
      default: "3:4"

  reference_logic:

    golden_rule:
      product_reference: product_identity
      sku_data: product_version
      style_reference: visual_presentation
      logo_reference: brand_identity

    priority:
      - current_user_explicit_correction
      - current_written_sku_specification
      - designated_primary_product_reference
      - current_product_reference
      - dimension_reference
      - sku_reference
      - style_reference
      - previous_context

  task_isolation:

    reset_for_new_product:
      - brand
      - logo
      - product_structure
      - sku
      - dimensions
      - colors
      - materials
      - configuration
      - visual_plan
      - title
      - copy

  output:

    main:
      count: 1
      ratio: "1:1"
      filename: "Main01.jpg"

    secondary:
      count: 8
      ratio: "1:1"
      filename_pattern: "Secondary{index:02}.jpg"

    detail:
      count: 9
      ratio_from_input: detail_ratio
      filename_pattern: "Detail{index:02}.jpg"

    sku:
      count: one_per_valid_sku
      ratio: "1:1"
      filename_pattern: "SKU{index:02}.jpg"

    title:
      language: english
      max_characters: 240
      preferred_range:
        min: 160
        max: 220

  stages:

    stage_1:
      name: analysis_and_planning
      generate_images: false

      tasks:
        - recognize_brand
        - identify_logo
        - classify_references
        - understand_product
        - create_product_structure_lock
        - normalize_sku
        - verify_dimensions
        - verify_colors
        - verify_materials
        - verify_configuration
        - identify_customer_questions
        - create_visual_narrative
        - plan_main_image
        - plan_secondary_images
        - run_secondary_diversity_check
        - plan_detail_images
        - run_detail_diversity_check
        - plan_sku_images
        - create_title
        - create_product_copy
        - create_generation_lock
        - wait_for_confirmation

    stage_2:
      name: image_generation
      generate_images: true
      requires_confirmation: true

      generation_order:
        - main
        - secondary
        - detail
        - sku

  ecommerce_visual_narrative:

    journey:
      - attention
      - product_understanding
      - core_function
      - product_proof
      - lifestyle_fit
      - size_and_variant_understanding
      - purchase_decision

    principle:
      one_primary_job_per_image: true
      max_secondary_jobs_per_image: 1
      adjacent_primary_message_duplication: prohibited

  main_secondary_sequence:

    main01:
      customer_question: "What is this product?"
      purpose: product_hero
      preferred_view:
        - front_three_quarter
      content_priority:
        - complete_product
        - visual_identity
        - premium_presentation

    secondary01:
      customer_question: "What does it really look like?"
      purpose: alternative_product_view
      must_differ_from: main01

    secondary02:
      customer_question: "What is the main reason to buy it?"
      purpose: core_function

    secondary03:
      customer_question: "How useful is the available space?"
      purpose: capacity_or_space_utilization

    secondary04:
      customer_question: "Is the structure stable?"
      purpose: structural_proof
      preferred_views:
        - rear_three_quarter
        - low_angle
        - under_product
        - frame_closeup

    secondary05:
      customer_question: "What materials and details am I getting?"
      purpose: material_and_craft
      preferred_views:
        - macro
        - closeup

    secondary06:
      customer_question: "How does it fit into real life?"
      purpose: lifestyle_usage

    secondary07:
      customer_question: "What practical problem does it solve?"
      purpose: special_feature_or_problem_solution

    secondary08:
      customer_question: "Which version should I choose?"
      purpose: decision_support
      preferred_content:
        - dimensions
        - variants
        - colors
        - orientation
        - sku_comparison

  main_secondary_diversity:

    same_exact_camera_treatment_max: 2

    adjacent_same_primary_message:
      allowed: false

    require_mix_of:
      - product_hero
      - alternate_angle
      - functional_view
      - structural_view
      - material_closeup
      - lifestyle_scene
      - decision_support

    prohibit:
      - identical_render_reuse
      - text_only_variation
      - background_only_variation
      - sticker_only_variation
      - same_angle_full_set

    preferred_camera_pool:
      - front
      - front_left_three_quarter
      - front_right_three_quarter
      - side
      - rear
      - high_angle
      - low_angle
      - top_down
      - macro_closeup
      - environmental_wide

  detail_sequence:

    detail01:
      customer_question: "Why is this product useful?"
      purpose: product_value_overview
      recommended_visual: lifestyle_overview

    detail02:
      customer_question: "Will it fit my space?"
      purpose: dimensions_and_space_fit
      verified_dimensions_required: true

    detail03:
      customer_question: "What materials am I getting?"
      purpose: material_explanation
      recommended_visual:
        - macro
        - closeup

    detail04:
      customer_question: "Why is it stable or well structured?"
      purpose: structural_proof
      recommended_visual:
        - rear
        - under_product
        - low_angle
        - joint_closeup

    detail05:
      customer_question: "How does the main function work?"
      purpose: core_function_demonstration

    detail06:
      customer_question: "How much can I realistically store or use?"
      purpose: storage_or_capacity

    detail07:
      customer_question: "How does it look in a real home?"
      purpose: lifestyle_scene

    detail08:
      customer_question: "What additional practical detail should I know?"
      purpose: secondary_feature_or_fine_detail
      possible_topics:
        - adjustable_feet
        - assembly
        - hardware
        - cable_management
        - wheels
        - hooks
        - edge_finish
        - maintenance

    detail09:
      customer_question: "Which version should I buy?"
      purpose: buying_guide
      preferred_content:
        - sku_comparison
        - color_comparison
        - dimension_comparison
        - orientation_comparison
        - configuration_comparison

  detail_diversity:

    recommended_visual_coverage:
      - lifestyle_full_product
      - dimension_view
      - material_macro
      - structural_view
      - function_in_use
      - capacity_view
      - wide_room_scene
      - component_detail
      - variant_comparison

    same_exact_camera_treatment_max: 2

    adjacent_same_primary_message:
      allowed: false

    require_new_information_per_image: true

    prohibit:
      - repeated_same_render
      - text_only_changes
      - icon_only_changes
      - background_only_changes
      - sticker_only_changes

  information_overlap:

    adjacent_image_overlap_target:
      max_percent: 30

    repeated_feature_allowed_only_when:
      - new_information_is_added
      - new_customer_question_is_answered
      - new_physical_detail_is_shown

  product_category_adaptation:

    desk:
      priority:
        - workspace
        - monitor_and_laptop_use
        - legroom
        - storage
        - cable_management
        - corner_configuration
        - dimensions

    storage_rack:
      priority:
        - shelf_count
        - shelf_spacing
        - capacity
        - frame
        - appliance_fit
        - storage_scenarios
        - dimensions

    bed:
      priority:
        - overall_frame
        - structural_support
        - slats
        - underbed_clearance
        - bedroom_scene
        - size_options

    cabinet:
      priority:
        - storage
        - compartment_layout
        - door_drawer_operation
        - material
        - frame
        - room_placement

    rolling_cart:
      priority:
        - mobility
        - caster_detail
        - shelf_capacity
        - handle
        - multiroom_use
        - dimensions

    side_table:
      priority:
        - bedside_usage
        - storage
        - compact_size
        - height
        - hidden_storage
        - cable_management

  sku_images:

    purpose: accurate_variant_selection

    visual_strategy:
      consistency_priority: high
      lifestyle_priority: low

    require:
      - correct_product
      - correct_color
      - correct_configuration
      - correct_orientation
      - exact_dimensions

    preferred_camera:
      consistent_across_variants: true

    note: >
      Marketing images should maximize visual diversity.
      SKU images should maximize visual consistency for comparison.

  product_fidelity:

    priority: highest

    lock:
      - structure
      - shelf_count
      - drawer_count
      - door_count
      - leg_count
      - frame_geometry
      - tabletop_shape
      - crossbars
      - orientation
      - color
      - dimensions
      - sockets
      - hooks
      - footrest
      - wheels
      - side_pockets
      - cable_holes
      - material

    unverified_feature_creation:
      allowed: false

  dimensions:

    default_order:
      - length
      - width
      - height

    exact_when_supplied: true
    sku_specific: true
    guessing_allowed: false

  image_language:

    default: english

    allowed:
      - english
      - malay
      - english_malay

    chinese_default_allowed: false

  claims:

    unsupported_claims:
      prohibited: true

    require_verification:
      - weight_capacity
      - waterproof
      - scratchproof
      - rustproof
      - fireproof
      - certification
      - warranty
      - delivery_time
      - assembly_time

  stage_1_output:

    sections:
      - current_task_recognition
      - product_understanding
      - sku_master_table
      - conflict_check
      - ecommerce_visual_story
      - main_secondary_plan
      - main_secondary_diversity_check
      - detail_plan
      - detail_diversity_check
      - sku_plan
      - english_title
      - product_copy
      - generation_lock
      - expected_image_count

  diversity_qa:

    secondary_check:
      verify:
        - different_primary_purposes
        - angle_diversity
        - scene_diversity
        - closeup_coverage
        - structural_coverage
        - function_coverage
        - purchase_decision_coverage

    detail_check:
      verify:
        - full_product
        - dimensions
        - material
        - structure
        - function
        - capacity
        - lifestyle
        - fine_detail
        - buying_guide

    on_failure:
      action: replan_before_generation

  stage_2_pre_generation:

    before_each_image:
      verify:
        - unique_primary_job
        - meaningful_new_information
        - planned_camera_angle
        - correct_product
        - correct_logo
        - correct_sku
        - correct_dimensions
        - correct_language
        - correct_ratio

      if_not_unique:
        action: replan

  final_principle: >
    A complete e-commerce image set is not a group of repeated decorated
    product photos. Each image must answer a different customer question and
    move the shopper closer to a confident purchase decision.