<cfif IsDefined("form.Submit")>
    <form action = "SampleSearch.cfm?mode=view" method = "POST" class = "ml-5">
        <h2>Enter sample number</h2>
        <input type = "number" name = "sampleNumber" id = "sampleNumber" placeholder = "Sample Number">
        <br><br>
        <label for="department">Year</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <select class="custom-select" name = "yearSelect" id = "yearSelect">
            <cfloop index = "year" from = "2000" to = "2018">
                <cfoutput><option value = "#year#">#year#</option></cfoutput>
            </cfloop>
        </select>
        <br><br>
        <input type = "submit" class = "btn-primary" name = "Submit" id = "submit" value = "Search">
    </form>
    <cfstoredproc procedure = "proc_qry_getSample" dataSource = "agfirstdb2">
        <cfprocparam type = "in" value = "#form.sampleNumber#" CFSQLType = "cf_sql_integer">
        <cfprocresult name = "Variables.samples">
    </cfstoredproc>
    <cfdump var = "#Variables.samples#">
<cfelse>
    <form action = "SampleSearch.cfm?mode=view" method = "POST" class = "ml-5">
        <h2>Enter sample number</h2>
        <input type = "number" name = "sampleNumber" id = "sampleNumber" placeholder = "Sample Number">
        <br><br>
        <label for="department">Year</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <select class="custom-select" name = "yearSelect" id = "yearSelect">
            <cfloop index = "year" from = "2000" to = "2018">
                <cfoutput><option value = "#year#">#year#</option></cfoutput>
            </cfloop>
        </select>
        <br><br>
        <input type = "submit" class = "btn-primary" name = "Submit" id = "submit" value = "Search">
    </form>
</cfif>