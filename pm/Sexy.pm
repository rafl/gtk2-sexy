package Gtk2::Sexy;

use strict;
use warnings;
use base 'DynaLoader';

our $VERSION = 0.01;

sub dl_load_flags { 0x01 }

bootstrap Gtk2::Sexy $VERSION;

=head1 NAME

Gtk2::Sexy - Perl interface to the sexy widget collection

=head1 DESCRIPTION

This module allows a perl developer to access the widgets of the sexy widget
collection, which currently includes the following widgets:

=over 2

=item SexyIconEntry

SexyIconEntry is a GtkEntry with support for inline icons. They can appear on
either side of the entry or on both sides. There's also built-in support for
adding a clear button for clearing the entry. This widget is particularly
useful as search fields.

=item SexySpellEntry

SexySpellEntry is a GtkEntry with inline spell checking. This makes use of
Enchant and allows the user to see what they've typed wrong as they type it. A
right-click menu is provided for misspelled words offering suggestions.

=item SexyUrlLabel

SexyUrlLabel is a GtkLabel with support for embedded hyperlinks. It uses a
modified form of the Pango markup format that supports the 

  <a href="...">...</a>
  
tag. The hyperlink will appear in blue and can be activated by clicking it.
Right-clicking the hyperlink displays a menu offering the ability to activate
it or to copy the URL. 

=back

=head1 SEE ALSO

L<Gtk2>(3pm), L<Gtk2::Sexy::index>(3pm)

=head1 AUTHOR

Florian Ragwitz <rafl@debian.org>

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2005-2006 by Florian Ragwitz

This library is free software; you can redistribute it and/or modify it under
the terms of the GNU Lesser General Public License as published by the Free
Software Foundation; either version 2.1 of the License, or (at your option) any
later version.

This library is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more
details.

You should have received a copy of the GNU Lesser General Public License along
with this library; if not, write to the Free Software Foundation, Inc., 59
Temple Place - Suite 330, Boston, MA  02111-1307, USA.

=cut

1;
