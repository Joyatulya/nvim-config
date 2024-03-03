local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.conditions")
local conds_expand = require("luasnip.extras.conditions.expand")

ls.add_snippets("all", {
	s("supeform_c", fmta([[
		
<<script lang="ts">>
	import * as Form from "@shad_comp/ui/form";
	import * as Select from "@shad_comp/ui/select";
	import { Input } from "@shad_comp/ui/input";
	import { Button } from "@shad_comp/ui/button";
	import { Textarea } from "@shad_comp/ui/textarea";
	import { type SuperValidated, type Infer, superForm } from "sveltekit-superforms";
	import { zodClient } from "sveltekit-superforms/adapters";

	export let data: SuperValidated<<Infer<<ProfileFormSchema>>>>;

	const form = superForm(data, {
		validators: zodClient(profileFormSchema),
	});

	const { form: formData, enhance, submitting, delayed } = form;

<</script>>

<<form method="POST" class="space-y-8" use:enhance id="profile-form">>
	<<Form.Field {form} name="username">>
		<<Form.Control let:attrs>>
			<<Form.Label>>Username<</Form.Label>>
			<<Input placeholder="@shadcn" {...attrs} bind:value={$formData.username} />>
		<</Form.Control>>
		<<Form.Description>>
			This is your public display name. It can be your real name or a pseudonym. You can only
			change this once every 30 days.
		<</Form.Description>>
		<<Form.FieldErrors />>
	<</Form.Field>>
	<<Form.Button {delayed} {submitting}>>
		Save
	<</Form.Button>>
<</form>>

	]],
		{}
	)), })
