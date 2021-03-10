<cfoutput>
	<div class="d-flex">
        <h2 class="mr-3">Edit Post ###prc.post.getId()#</h2>
        #html.startForm( method = "DELETE", action = event.buildLink( "posts.#prc.post.getId()#" ) )#
            <button type="submit" class="btn btn-outline-danger">Delete</button>
        #html.endForm()#
    </div>
    #html.startForm( method = "PUT", action = event.buildLink( "posts.#prc.post.getId()#" ) )#
		<div class="form-group">
			<label for="title">Title</label>
			<input type="text" class="form-control" name="title" id="title" value="#prc.post.getTitle()#">
            <cfif prc.errors.keyExists( "title" )>
                <small class="form-text text-danger">
                    <cfloop array="#prc.errors.title#" index="error">
                        <p>#error.message#</p>
                    </cfloop>
                </small>
            </cfif>
		</div>
		<div class="form-group">
			<label for="body">Body</label>
			<textarea class="form-control" name="body" id="body" rows="3">#prc.post.getBody()#</textarea>
            <cfif prc.errors.keyExists( "body" )>
                <small class="form-text text-danger">
                    <cfloop array="#prc.errors.body#" index="error">
                        <p>#error.message#</p>
                    </cfloop>
                </small>
            </cfif>
		</div>
        <div class="form-group">
			<label for="tags">Tags</label>
			<select name="tags" id="tags" multiple="true" class="form-control">
                <cfloop array="#prc.tags#" index="tag">
                    <option
                        value="#tag.getID()#"
                        <cfif prc.post.hasTag( tag )>selected</cfif>
                    >
                        #tag.getName()#
                    </option>
                </cfloop>
            </select>
            <cfif prc.errors.keyExists( "tags" )>
                <small class="form-text text-danger">
                    <cfloop array="#prc.errors.tags#" index="error">
                        <p>#error.message#</p>
                    </cfloop>
                </small>
            </cfif>
		</div>
		<a href="#event.buildLink( "posts" )#" class="btn btn-outline">Back</a>
		<button type="submit" class="btn btn-primary">Submit</button>
	#html.endForm()#
</cfoutput>
