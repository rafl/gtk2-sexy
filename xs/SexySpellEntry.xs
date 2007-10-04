#include "sexyperl.h"

MODULE = Gtk2::Sexy::SpellEntry	PACKAGE = Gtk2::Sexy::SpellEntry	PREFIX = sexy_spell_entry_

GtkWidget*
sexy_spell_entry_new(class)
	C_ARGS:

void
sexy_spell_entry_get_languages(entry)
		const SexySpellEntry* entry
	PREINIT:
		GSList* list = NULL;
	PPCODE:
		list = sexy_spell_entry_get_languages(entry);
		if (list) {
			GSList* curr;
			for (curr = list; curr; curr = g_slist_next (curr))
				XPUSHs(sv_2mortal(newSVGChar(curr->data)));

			g_slist_foreach(list, (GFunc)g_free, NULL);
			g_slist_free(list);
		} else {
			XSRETURN_EMPTY;
		}

gchar*
sexy_spell_entry_get_language_name(entry, lang)
		const SexySpellEntry* entry
		const gchar* lang

gboolean
sexy_spell_entry_language_is_active(entry, lang)
		const SexySpellEntry* entry
		const gchar* lang

gboolean
sexy_spell_entry_activate_language(entry, lang)
		SexySpellEntry* entry
		const gchar* lang
	PREINIT:
		GError* error = NULL;
	CODE:
		RETVAL = sexy_spell_entry_activate_language(entry, lang, &error);
		
		if (error)
			gperl_croak_gerror(NULL, error);
	OUTPUT:
		RETVAL

void
sexy_spell_entry_deactivate_language(entry, lang)
		SexySpellEntry* entry
		const gchar* lang

gboolean
sexy_spell_entry_set_active_languages(entry, ...)
		SexySpellEntry* entry
	PREINIT:
		GSList* langs = NULL;
		GError* error = NULL;
		int i;
	CODE:
		for (i = items - 1; i >= 1; i--)
			langs = g_slist_prepend(langs, SvGChar( ST(i) ));

		RETVAL = sexy_spell_entry_set_active_languages(entry, langs, &error);

		if (error)
			gperl_croak_gerror(NULL, error);
	OUTPUT:
		RETVAL

void
sexy_spell_entry_get_active_languages(entry)
		SexySpellEntry* entry
	PREINIT:
		GSList* list = NULL;
	PPCODE:
		list = sexy_spell_entry_get_active_languages(entry);
		if (list) {
			GSList* curr;
			for (curr = list; curr; curr = g_slist_next (curr))
				XPUSHs(sv_2mortal(newSVGChar(curr->data)));

			g_slist_foreach(list, (GFunc)g_free, NULL);
			g_slist_free(list);
		} else {
			XSRETURN_EMPTY;
		}

gboolean
sexy_spell_entry_is_checked(entry)
		SexySpellEntry* entry

void
sexy_spell_entry_set_checked(entry, checked)
		SexySpellEntry* entry
		gboolean checked

void
sexy_spell_entry_activate_default_languages(entry)
		SexySpellEntry* entry
