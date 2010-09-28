package SanitizeBlogs2::L10N::fr;

use strict;
use base 'SanitizeBlogs2::L10N::en_us';
use vars qw( %Lexicon );

%Lexicon = (
	'Strip unwanted HTML tags from entries and pages created in blogs.' => 'Supprime les tags HTML non autorisés des entrées et pages des blogs.',
	'Allowed tags for this blog' => 'Tags autorisés pour ce blog',
	'List of allowed HTML tags and tag attributes for this blog. Tags should be comma-separated.<br/>Tag attributes should be space-separated and listed after the tag which they can be used with. eg. &quot;a href,em,strong&quot;<br/>(Functions in same manner as, but is distinct from, the <a href="[_1]">GlobalSanitizeSpec</a> configuration setting.)' => 'Liste des tags et attributs autorisés pour ce blog. Les tags doivent être séparés par des virgules, les attributs par des espaces et placés juste après le tag dans lequel ils peuvent être utilisés.<br/>Ex. &quot;a href,em,strong&quot; (Fonctionne de la même manière que, mais est distinct du paramètre de configuration <a href="[_1]">GlobalSanitizeSpec</a>.)',
	'Do not sanitize this blog' => 'Ne pas nettoyer ce blog',
	'If checked, entries on this blog will <em>not</em> be sanitized.' => 'Si cette case est cochée, ce blog ne sera pas nettoyé.',
	'Allowed Tags' => 'Tags autorisés',
	'List of allowed HTML tags and tag attributes. Tags should be comma-separated.<br/>Tag attributes should be space-separated and listed after the tag which they can be used with. eg. &quot;a href,em,strong&quot;<br/>(Functions in same manner as, but is distinct from, the <a href="[_1]">GlobalSanitizeSpec</a> configuration setting.)' => 'Liste des tags et attributs autorisés. Les tags doivent être séparés par des virgules, les attributs par des espaces et placés juste après le tag dans lequel ils peuvent être utilisés.<br/>Ex. &quot;a href,em,strong&quot; (Fonctionne de la même manière que, mais est distinct du paramètre de configuration <a href="[_1]">GlobalSanitizeSpec</a>.)',
);

1;
