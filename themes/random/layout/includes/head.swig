{% set pageTitle = page.title || config.subtitle || '' %}
{% if is_archive() %}
  {% set pageTitle = _p('archive_title') %}
{% endif %}
{% if is_tag() %}
  {% set pageTitle = __('tag_title') + ': ' + page.tag %}
{% endif %}
{% if is_category() %}
  {% set pageTitle = __('category_title') + ': ' + page.category %}
{% endif %}
{% if is_month() %}
  {% set pageTitle = pageTitle + ': ' + page.month + '/' + page.year %}
{% endif %}
{% if is_year() %}
  {% set pageTitle = pageTitle + ': ' + page.year %}
{% endif %}
{% set pageTitle = pageTitle + ' [ ' + config.title + ' ]' %}
<!doctype html>
<html lang="{{ config.language }}">
<head>
  <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  {% if config.author %}
  <meta name="author" content="{{config.author}}">
  {% endif %}
  {% if config.keywords || theme.keywords %}
  <meta name="keywords" content="{{config.keywords || theme.keywords}}">
  {% endif %}
  {% set metaDescription = trim(strip_html(page.description || page.excerpt || page.content || config.description)) %}
  {% if metaDescription.length > 200 %}
    <meta name="description" content="{{ truncate( metaDescription, {length: 200}) }}">
  {% else %}
    <meta name="description" content="{{ metaDescription }}">
  {% endif %}
  <title>{{ pageTitle }}</title>
  {% if config.feed || theme.feed %}
    {{ feed_tag(config.feed.path || theme.feed.path, {title: config.title, type: config.feed.type || theme.feed.type}) }}
  {% endif %}

	<link rel="apple-touch-icon-precomposed" sizes="57x57" href="apple-touch-icon-57x57.png" />
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="apple-touch-icon-114x114.png" />
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="apple-touch-icon-72x72.png" />
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="apple-touch-icon-144x144.png" />
	<link rel="apple-touch-icon-precomposed" sizes="60x60" href="apple-touch-icon-60x60.png" />
	<link rel="apple-touch-icon-precomposed" sizes="120x120" href="apple-touch-icon-120x120.png" />
	<link rel="apple-touch-icon-precomposed" sizes="76x76" href="apple-touch-icon-76x76.png" />
	<link rel="apple-touch-icon-precomposed" sizes="152x152" href="apple-touch-icon-152x152.png" />
	<link rel="icon" type="image/png" href="favicon-196x196.png" sizes="196x196" />
	<link rel="icon" type="image/png" href="favicon-96x96.png" sizes="96x96" />
	<link rel="icon" type="image/png" href="favicon-32x32.png" sizes="32x32" />
	<link rel="icon" type="image/png" href="favicon-16x16.png" sizes="16x16" />
	<link rel="icon" type="image/png" href="favicon-128.png" sizes="128x128" />
	<meta name="application-name" content="&nbsp;"/>
	<meta name="msapplication-TileColor" content="#FFFFFF" />
	<meta name="msapplication-TileImage" content="mstile-144x144.png" />
	<meta name="msapplication-square70x70logo" content="mstile-70x70.png" />
	<meta name="msapplication-square150x150logo" content="mstile-150x150.png" />
	<meta name="msapplication-wide310x150logo" content="mstile-310x150.png" />
	<meta name="msapplication-square310x310logo" content="mstile-310x310.png" />

  {% if config.favicon || theme.favicon%}
    {{ favicon_tag(config.favicon || theme.favicon) }}
  {% endif %}
  {% if theme.stylesheets !== undefined && theme.stylesheets.length > 0 %}
  {{ css(theme.stylesheets) }}
  {% endif %}
</head>
