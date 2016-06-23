var express = require('express');
var formidable = require('formidable');
var pathUtil = require('path');

var fs = require('fs');

var uploadDir = __dirname + '/files';
if ( !fs.existsSync(uploadDir) ) {
   console.log('files 폴더 생성하시오.');
   process.exit();   
}

var app = express();
app.post('/', handlePostReqeust);
app.get('/', showMovieList);
app.get('/post', showNewMovieForm);

app.use(express.static(uploadDir));


app.listen(3001, function() {
   console.log('Server is listening @ 3001');
});

var movieList = [];

function handlePostReqeust(req, res) {
	var form = new formidable.IncomingForm();
	form.encoding = 'utf-8';
	form.uploadDir = uploadDir;	
	form.keepExtensions = true;

	form.parse(req, function(err, fields, files) {
      if ( err ) {
         console.error('Form parsing Error', err);
         res.sendStatus(500);
         return;   
      }
      
		var file = files['poster'];
      // console.log('poster : ',file);
      var poster;
      if ( file && file.path ) {
         poster = pathUtil.basename(file.path); 
      }
      
      var title = fields['title'];     
      console.log('title : ' + title);
      
      if ( !title ) {
         res.sendStatus(400);
         return;
      }
      
      var info = {
         title : title,
         poster : poster
      }
      
      movieList.push(info);
      res.redirect('/');
   });
}

function showNewMovieForm(req, res) {
	res.writeHeader(200, {'Content-Type':'text/html; charset=utf-8'});
   
   var body = '<html><head><meta charset="utf-8"></head><body>'
   body += '<h3>새 영화 입력</h3>';   
 	body += '<form method="post" action="." enctype="multipart/form-data">';
   body += '<div><label>영화 제목</label><input type="text" placeholder="영화제목" name="title"></div>';
   body += '<div><label>포스터</label><input type="file" name="poster"></div>'
   body += '<div><input type="submit" value="upload"></div>';
   body += '</form>';
   body += '</body></html>';
   res.end(body); 
}

function showMovieList(req, res) {   
	res.writeHeader(200, {'Content-Type':'text/html; charset=utf-8'});
   
   var body = '<html><head><meta charset="utf-8"></head><body>'
   body += '<h3>Favorite Movie</h3>';
	body += '<div><ul>';
	
	movieList.forEach(function(item) {
		body += '<li>';
      if ( item.poster )
         body += '<img src="' + item.poster + '" height="100px">';
      body += item.title + '</li>';
	}, this);
	body += '</ul></div>';
   
   body += '<div><a href="post">Post New Movie</a></div>';
	
   body += '</body></html>';
   res.end(body);
}

// For Debugging
function showBody(req, res) {
   console.log(req.headers);
   console.log('===');
   
   var body = '';
   req.on('data', function(chunk) {
      body += chunk;
   });
   req.on('end', function() {
      console.log(body);
      res.sendStatus(200);
   })
}
