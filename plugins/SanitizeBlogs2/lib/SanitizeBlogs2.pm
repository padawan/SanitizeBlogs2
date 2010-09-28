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

    require MT::Entry;
    require MT::Blog;
    require MT::Sanitize;

    my $blog = $app->model('blog')->load($blog_id);
    return $cb->errtrans("Invalid blog ID") unless $blog;

	if ($blog_sanitize_spec) { $sanitize_spec = $blog_sanitize_spec; }

    my $title = $entry->title;
    $title = $title ? MT::Sanitize->sanitize( $title, $sanitize_spec ) : $title;
    $entry->title($title);

    my $text = $entry->text;
    $text = $text ? MT::Sanitize->sanitize( $text, $sanitize_spec ) : $text;
    $entry->text($text);

    my $more = $entry->text_more;
    $more = $more ? MT::Sanitize->sanitize( $more, $sanitize_spec ) : $more;
    $entry->text_more($more);

    my $excerpt = $entry->excerpt;
    $excerpt = $excerpt ? MT::Sanitize->sanitize( $excerpt, $sanitize_spec ) : $excerpt;
    $entry->excerpt($excerpt);

    my $keywords = $entry->keywords;
    $keywords = $keywords ? MT::Sanitize->sanitize( $keywords, $sanitize_spec ) : $keywords;
    $entry->keywords($keywords);

    return 1;
}

1;
