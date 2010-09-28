# SanitizeBlogs2, a plugin for Movable Type

**SanitizeBlogs2** is a variant of the [mt-plugin-SanitizeBlogs](http://github.com/sixapart/mt-plugin-SanitizeBlogs) by Six Apart. While the Six Apart version sanitizes blogs based upon a blog URL prefix (useful for blogs published under the Community Platform), the present variant is more useful for a blog farm where you want all blogs to be sanitized with the ability to refine or prevent the sanitization for selected blogs.

## Overview

Specify HTML tags and attributes allowed in entry/page fields based upon system or blog settings.

Functions in same manner as, but is distinct from, the [GlobalSanitizeSpec](http://www.movabletype.org/config/globalsanitizespec) configuration directive.

A typical use case of this plugin is to cleanup the mess introduced by authors copying and pasting texts from Microsoft Word. Newest versions of MS Word will typically introduce invalid HTML code that can break a site layout and CSS styles.

## Requirements

* MT 4.x (works with MT5)


## Features

* define list of allowed html tags allowed in the following fields:
    * Title
    * Body
    * Extended
    * Excerpt
    * Keywords
* specify the list at both system- and blog-level
* capability to exclude a blog from the sanitization


## Documentation

### Allowed Tags and Attributes

List of allowed HTML tags and tag attributes. Allowed Tags should be comma-separated. Allowed tag attributes should be space-separated and listed after the tag which they can be used with.

Restrictive sample value (allows `href` and `class` attributes on the `a` tag):

    a href class,b,cite,code class,em,i,img,li,ol,pre,strike,strong,ul

Relaxed sample value that works well for regular blogs to cleanup the MS Word tag soup:

    a href target title,b,i,br/,p,strong,em,ul,ol,li,blockquote,pre,img *,div style,object *,param *,embed *

The list can be defined at both system- and blog-level.
The system list will be applied by default to all blogs in the system, unless for blogs with their own list or that are specifically excluded from the sanitization.
If the system list is empty, then only blogs that have a list defined at their level will be sanitized. 


## Installation

1. Download <a href="http://github.com/padawan/mt-plugin-SanitizeBlogs" onClick="javascript: pageTracker._trackPageview('/software/SanitizeBlogs.github');">SanitizeBlogs</a>.
1. Uncompress and move the SanitizeBlogs directory to the MT `plugins` directory. [More in-depth plugin installation instructions](http://tinyurl.com/easy-plugin-install).
1. In the plugin preferences at the system-level enter a list of allowed tags to apply by default to all blogs.
Optionnaly, refine this list or exclude specific blogs at the blog-level.


## Note

Installing both variants of the SanitizeBlogs plugins on the same MT installation has not been tested. Their plugin keys are different, so their respective preferences will not clash, however they will act concurrently in an unpredictable order if you define a blog-level list in SanitizeBlogs2.


## Credits

Authors: [Ubiquitic](http://ubiquitic.com/), based on code by Six Apart Ltd.  
Copyright: 2010 Ubiquitic, 2009 Six Apart Ltd.  
License: [Artistic License 2.0](http://www.opensource.org/licenses/artistic-license-2.0.php)

This free software is provided as-is WITHOUT ANY KIND OF GUARANTEE; you can redistribute it and/or modify it under the same terms as Perl itself.