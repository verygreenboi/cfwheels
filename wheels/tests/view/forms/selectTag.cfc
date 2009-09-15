<cfcomponent extends="wheels.test">

	<cfset global.controller = createobject("component", "wheels.Controller")>
	<cfset global.options.simplevalues = '<select id="testselect" name="testselect"><option value="first">first</option><option value="second">second</option><option value="third">third</option></select>'>
	<cfset global.options.complexvalues = '<select id="testselect" name="testselect"><option value="1">first</option><option value="2">second</option><option value="3">third</option></select>'>

	<cffunction name="test_list_for_option_values">
		<cfset loc.args.name = "testselect">
		<cfset loc.args.options = "first,second,third">
		<cfset halt(false, "loc.controller.selectTag(argumentcollection=loc.args)")>
		<cfset loc.r = loc.controller.selectTag(argumentcollection=loc.args)>
		<cfset assert('loc.options.simplevalues eq loc.r')>
	</cffunction>

	<cffunction name="test_struct_for_option_values">
		<cfset loc.args.name = "testselect">
		<cfset loc.args.options = {1="first", 2="second", 3="third"}>
		<cfset halt(false, "loc.controller.selectTag(argumentcollection=loc.args)")>
		<cfset loc.r = loc.controller.selectTag(argumentcollection=loc.args)>
		<cfset assert('loc.options.complexvalues eq loc.r')>
	</cffunction>

	<cffunction name="test_one_dimensional_array_for_option_values">
		<cfset loc.args.name = "testselect">
		<cfset loc.args.options = ["first", "second", "third"]>
		<cfset halt(false, "loc.controller.selectTag(argumentcollection=loc.args)")>
		<cfset loc.r = loc.controller.selectTag(argumentcollection=loc.args)>
		<cfset assert('loc.options.simplevalues eq loc.r')>
	</cffunction>

	<cffunction name="test_two_dimensional_array_for_option_values">
		<cfset loc.args.name = "testselect">
		<cfset loc.args.options = [[1, "first"],[2, "second"], [3, "third"]]>
		<cfset halt(false, "loc.controller.selectTag(argumentcollection=loc.args)")>
		<cfset loc.r = loc.controller.selectTag(argumentcollection=loc.args)>
		<cfset assert('loc.options.complexvalues eq loc.r')>
	</cffunction>

	<cffunction name="test_three_dimensional_array_for_option_values">
		<cfset loc.args.name = "testselect">
		<cfset loc.args.options = [[1, "first", "a"],[2, "second", "b"], [3, "third", "c"]]>
		<cfset halt(false, "loc.controller.selectTag(argumentcollection=loc.args)")>
		<cfset loc.r = loc.controller.selectTag(argumentcollection=loc.args)>
		<cfset assert('loc.options.complexvalues eq loc.r')>
	</cffunction>

	<cffunction name="test_query_for_option_values">
		<cfset loc.q = querynew("")>
		<cfset loc.id = [1,2,3]>
		<cfset loc.name = ["first", "second", "third"]>
		<cfset queryaddcolumn(loc.q, "id", loc.id)>
		<cfset queryaddcolumn(loc.q, "name", loc.name)>
		<cfset loc.args.name = "testselect">
		<cfset loc.args.options = loc.q>
		<cfset halt(false, "loc.controller.selectTag(argumentcollection=loc.args)")>
		<cfset loc.r = loc.controller.selectTag(argumentcollection=loc.args)>
		<cfset assert('loc.options.complexvalues eq loc.r')>
	</cffunction>

</cfcomponent>