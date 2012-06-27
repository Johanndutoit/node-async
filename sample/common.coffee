async_block = require '../'

async_block([
		{
			name: 'd1',
			task: (params, callback) ->
				callback null, 'testing 2'
		},
		{
			name: 'd2',
			task: (params, callback) ->
				callback 'Something went wrong!'
		}
	], (results) ->

		if results.d1.result is true
			console.log "D1 Success: " + results.d1.value
		else
			console.log "D1 Fail: " + results.d1.value



		if results.d2.result is true
			console.log "D1 Success: " + results.d2.value
		else
			console.log "D1 Fail: " + results.d2.value
	)