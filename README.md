
<h1>Still a lot to do! Give me a chance to finish.</h1>

## Installation
 
    $ npm install node-async

## Quick Start

```js
var async_block = require('node-async');

async_block(
	[
		{
			name: 'get_twitter_feed',
			task: function(params, callback) {
				// Do http request etc.
				callback null, data_from_twitter
			}
		},
		{
			name: 'get_facebook_feed',
			task: function(params, callback) {
				// Do http request etc.
				callback null, data_from_facebook
			}
		},
		{
			name: 'perform_some_calculation',
			task: function(params, callback) {
				// Do http request etc.
				callback 'Error while performing Calculation'
			}
		}
	],
	function(results) {

		if(results.get_twitter_feed.result == true) {
			console.log("From Twitter: " + results.get_twitter_feed.value);
		} else {
			// handle error
			console.log("Error: " + results.get_twitter_feed.error)
		}

		if(results.get_facebook_feed.result == true) {
			console.log("From Facebook: " + results.get_facebook_feed.value);
		} else {
			// handle error
			console.log("Error: " + results.get_facebook_feed.error)
		}

		if(results.perform_some_calculation.result == true) {
			// Do something nice
		} else {
			// Handle Error
			console.log("Error: " + results.perform_some_calculation.error)
		}

	}
);
```

	Will Produce:

		$ From Twitter: {some data you got}
		$ From Facebook: {some data you got}
		$ Error: {The error we received.}

## License 

(The MIT License)

Copyright (c) 2009-2012 TJ Holowaychuk &lt;tj@vision-media.ca&gt;

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.