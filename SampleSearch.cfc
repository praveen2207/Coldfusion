<cfcomponent>
    <cffunction name = "fetchSample" returnType = "any" access = "public" description = "SampleSearch">
        <cfargument name="sampleNum" type="numeric" required="true" default="0">
        <cfstoredproc procedure = "proc_qry_getSample" dataSource = "agfirstdb2">
        <cfprocparam type = "in" value = "#sampleNum#" CFSQLType = "cf_sql_integer">
        <cfprocresult name = "Variables.samples">
    </cfstoredproc>
    <cfdump var = "#Variables.samples#">
    </cffunction>
</cfcomponent>