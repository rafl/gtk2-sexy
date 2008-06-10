#!/usr/bin/perl

use strict;
use warnings;
use Cwd;
use File::Spec;
use Gtk2::CodeGen;
use Glib::MakeHelper;
use ExtUtils::Depends;
use ExtUtils::PkgConfig;
use ExtUtils::MakeMaker;

mkdir 'build', 0777;

my %pkgconfig = ExtUtils::PkgConfig->find('libsexy');

Gtk2::CodeGen->parse_maps('sexy');
Gtk2::CodeGen->write_boot(ignore => qr/^Gtk2::Sexy$/);

our @xs_files = <xs/*.xs>;

our $sexy = ExtUtils::Depends->new('Gtk2::Sexy', 'Gtk2');
$sexy->set_inc($pkgconfig{cflags});
$sexy->set_libs($pkgconfig{libs});
$sexy->add_xs(@xs_files);
$sexy->add_pm('pm/Sexy.pm', '$(INST_LIBDIR)/Sexy.pm');
my $cwd = cwd();
$sexy->add_typemaps(map { File::Spec->catfile($cwd, $_) } File::Spec->catfile('build', 'sexy.typemap'));

$sexy->install(File::Spec->catfile('build', 'sexy-autogen.h'));
$sexy->save_config(File::Spec->catfile('build', 'IFiles.pm'));

WriteMakefile(
	NAME			=> 'Gtk2::Sexy',
	VERSION_FROM	=> File::Spec->catfile('pm', 'Sexy.pm'),
	XSPROTOARG		=> '-noprototypes',
	MAN3PODS		=> {
		'pm/Sexy.pm'	=> '$(INST_MAN3DIR)/Gtk2::Sexy.$(MAN3EXT)',
		Glib::MakeHelper->do_pod_files(@xs_files)
	},
	$sexy->get_makefile_vars,
	PREREQ_PM		=> {
		Gtk2	=> 0
	}
);

package MY;

sub postamble {
	return Glib::MakeHelper->postamble_clean()
		. Glib::MakeHelper->postamble_docs_full(
				DEPENDS		=> $main::sexy,
				XS_FILES	=> \@main::xs_files,
				COPYRIGHT	=> 'Copyright (C) 2005-2008 by Florian Ragwitz'
		);
}

package MAIN;
