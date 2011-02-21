package SanitizeBlogs2;
use strict;

sub _sanitize_entry {
    my ($cb, $app, $entry, $orig) = @_;
    my $plugin = $cb->plugin;
    my $blog_id = $entry->blog_id;

    return 1 if $plugin->get_config_value('sanitizeblogs_blog_dontsanitize', 'blog:'.$blog_id);
    my $sanitize_spec = $plugin->get_config_value('sanitizeblogs_sanitizespec');
    my $blog_sanitize_spec = $plugin->get_config_value('sanitizeblogs_blog_sanitizespec', 'blog:'.$blog_id);
    return 1 unless ($sanitize_spec || $blog_sanitize_spec);
    my $blog_sanitize_javascript_events = $plugin->get_config_value('sanitizeblogs_blog_sanitize_javascript_events', 'blog:'.$blog_id);

    require MT::Entry;
    require MT::Blog;
    require MT::Sanitize;

    my $blog = $app->model('blog')->load($blog_id);
    return $cb->errtrans("Invalid blog ID") unless $blog;

	if ($blog_sanitize_spec) { $sanitize_spec = $blog_sanitize_spec; }

   	$entry->title(MT::Sanitize->sanitize($entry->title, $sanitize_spec)) if $entry->title;
   	$entry->keywords(MT::Sanitize->sanitize($entry->keywords, $sanitize_spec)) if $entry->keywords;

	if ($blog_sanitize_javascript_events) {
		$blog_sanitize_spec .= ',*';
		for my $event (split /\s*,\s*/, $blog_sanitize_javascript_events) {
			$blog_sanitize_spec .= ' _'.$event;
		}
		$entry->text(unwrap_je(MT::Sanitize->sanitize(wrap_je($entry->text,$blog_sanitize_javascript_events), $sanitize_spec), $blog_sanitize_javascript_events)) if $entry->text;
		$entry->text_more(unwrap_je(MT::Sanitize->sanitize(wrap_je($entry->text_more,$blog_sanitize_javascript_events), $sanitize_spec), $blog_sanitize_javascript_events)) if $entry->text_more;
		$entry->excerpt(unwrap_je(MT::Sanitize->sanitize(wrap_je($entry->excerpt,$blog_sanitize_javascript_events), $sanitize_spec), $blog_sanitize_javascript_events)) if $entry->excerpt;
	} else {
		$entry->text(MT::Sanitize->sanitize($entry->text, $sanitize_spec)) if $entry->text;
		$entry->text_more(MT::Sanitize->sanitize($entry->text_more, $sanitize_spec)) if $entry->text_more;
		$entry->excerpt(MT::Sanitize->sanitize($entry->excerpt, $sanitize_spec)) if $entry->excerpt;
	}

    return 1;
}

sub wrap_je {
	my ($text,$events) = @_;
	my $wrapper = '';
	for my $event (split /\s*,\s*/, $events) {
		$wrapper = '_'.$event;
		$text =~ s/$event/$wrapper/gi;
	}
	return $text;
}

sub unwrap_je {
	my ($text,$events) = @_;
	my $wrapper = '';
	for my $event (split /\s*,\s*/, $events) {
		$wrapper = '_'.$event;
		$text =~ s/$wrapper/$event/eig;
	}
	return $text;
}

1;
