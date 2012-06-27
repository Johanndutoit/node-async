
Narrow = require 'narrow'

###

###
module.exports = exports = (funcs, done_callback) ->
	###
	Called by Narrow on each Request Info Object.

	From here we the request and call Narrows' callback (fn)
	###
	narrow_request_item_callback = (task_info, callback) ->

		if !task_info.params
			task_info.params = {}

		###
		On Load
		###
		if task_info.load
			task_info.load(task_info.params)

		###
		Perfom the task
		###
		task_info.task task_info.params, (err, result) ->
			if !err
				callback null, {
					result: true,
					value: result,
					name: task_info.name
				}
			else
				callback null, {
					result: false,
					error: err,
					name: task_info.name
				}

		###
		On Complete
		###
		if task_info.complete
			task_info.load(task_info.params)

	###
	Create the Narrow Instance to handle the Async Operation.
	###
	narrow = new Narrow 5, narrow_request_item_callback

	###
	This is where we will store our results.
	###
	results = Object()

	###
	Receives the Results and Creates a map for the cient
	###
	narrow.on('complete', (result) ->
		Object.defineProperty results, result.name, {
			value: result,
			writable: false,
			configurable: false
		}
	)

	###
	Pushes all the Requests to the Pipeline and waits for the results.

	When the results are received we return it to the callback.
	###
	narrow.pushAll(funcs, ->
		done_callback results
	)
