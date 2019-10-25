{%- macro clean_this(thing) -%}

  {% set clean_thing = thing | lower | replace(' ', '_') | replace ('/','_') %}

  {{return(clean_thing)}}

{%- endmacro -%}
