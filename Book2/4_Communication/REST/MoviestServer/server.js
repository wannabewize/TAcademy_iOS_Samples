var express = require('express');
var bodyParser = require('body-parser');
var morgan = require('morgan');

var app = express();
app.use(bodyParser.urlencoded({ extended: false }))

// 정적 파일 처리
app.use(express.static(__dirname + '/images'));

// Logging
app.use(morgan('dev'));

app.get('/movies', showMovieList);
app.post('/movies', addMovie);
app.get('/movies/:id', showMovieDetail);
app.delete('/movies/:id', deleteMovie);
app.put('/movies/:id', editMovie);

app.use(function(req, res) {
   res.sendStatus(400);
});

// // 여기까지 오면 - 그냥 목록 출력
// app.use('/', showMovieList);

app.listen(3000, function () {
	console.log('Moviest Server is listening @ 3000');
});

var movies = [
	{
		"id" : 0,
		"title": "아바타",
		"director": "제임스 카메론",
		"year": 2009,
		"synopsis": "인류의 마지막 희망, 행성 판도라! 이 곳을 정복하기 위한 ‘아바타 프로젝트’가 시작된다!"		
	}
];

function findMovie(id) {
	for(var i = 0 ; i < movies.length ; i++) {
		var item = movies[i];
		if ( item.id == id ) {
			console.log('findMovie : ', item);
			return item;
		}
	}
	return null;
}

function showMovieList(req, res) {
	var list = [];
	movies.forEach(function(item) {
      list.push({ title: item.title, id: item.id });
	})
   var result = {
      count: list.length,
      data: list
   };
   return res.json(result);
}

function addMovie(req, res) {

   var title = req.body.title;
	// 제목이 없으면 에러
	if (!title) {
		res.status(400).send({ msg: 'no title' });
      return;
	}
	
	var newItem = {};
	newItem.title = title;

	// id는 마지막 항목의 id + 1
	var last = movies[movies.length-1];
	if ( last ) {
		newItem.id = last.id + 1; 
	}
	else {
		newItem.id = 0;
	}

   var director = req.body.director;
	if (director) {
		newItem.director = director;
	}

	var yearStr = req.body.year;
	if (yearStr) {
		var year = parseInt(req.body.year);
		// 연도는 숫자로만
		if (!year) {
			res.status(400).send({ msg: 'year는 숫자만 입력' });
			return;
		}
		newItem.year = year;
	}

	var synopsis = req.body.synopsis;
	if (synopsis) {
		newItem.synopsis = synopsis;
	}
	movies.push(newItem);

   var result = { 'movie': newItem };

	res.json(result);
}

function showMovieDetail(req, res) {
	var id = req.params.id;
	if (!id) {
		res.status(404).send({ msg: 'Not Found movie id' });
		return;
	}

	var item = findMovie(id);
	console.log(item)
	if (item) {
		res.status(200).json({'data': item })
	}
	else {
		// 에러 처리 404
		res.status(404).send({ msg: 'Not Found' });
	}
}

// 영화 삭제
function deleteMovie(req, res) {		
	var id = req.params.id;
	item = findMovie(id);

	if ( ! item ) {
		res.status(400).send({msg:'Can not find movie'});
		return;
	}

	var index = movies.indexOf(item);
	movies.splice(index, 1);

	res.status(200).send({msg:'Success', data:item});
}

function editMovie(req, res) {
	// movie_id에 해당하는 영화 정보 얻기
	var id = req.params.id;	
	var item = findMovie(id);
	if (!item) {
		res.status(404).send({ msg: 'Not Found' });
		return;
	}

	// 감독 정보 수정
	var title = req.body.title;
	if (title) {
		item['title'] = title;
	}

	// 감독 정보 수정
	var director = req.body.director;
	if (director) {
		item['director'] = director;
	}

	// 연도 수정
	var yearStr = req.body.year;
	if (yearStr) {
		var year = parseInt(req.body.year);
		// 연도는 숫자로만
		if (!year) {
			res.status(400).send({ msg: 'year는 숫자만 입력' });
			return;
		}
		item['year'] = year;
	}

	// 시놉시스 수정
	var synopsis = req.body.synopsis;
	if (synopsis) {
		item['synopsis'] = synopsis;
	}
	
	res.send({msg:'수정 성공'});
}