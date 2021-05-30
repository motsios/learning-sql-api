var express = require('express')
var router = express.Router()
const sqldb_Web_App = require('../data/sqldb_Web_App.js')
const cors = require("cors")
const jwt = require("jsonwebtoken")
const jwt_decode = require('jwt-decode');
const fs = require('fs');
const dir = 'C:/Users/Pc/Desktop/diplwmatiki/learning-sql-api/uploads'
process.env.SECRETE_KEY = 'secret'

router.use(cors())

// *******************************************************************************************************
//  Verify Token START
// *******************************************************************************************************

function verifyTeacherToken(req, res, next) {
    const bearerHeader = req.headers['authorization']
    var decoded = jwt_decode(bearerHeader)
    if (decoded['role'] == 'teacher') {
        const bearerToken = bearerHeader.split(' ')[0]
        req.token = bearerToken
        next()
    } else {
        res.send({ error: "Unauthorized" });
    }
}

function verifyStudentToken(req, res, next) {
    const bearerHeader = req.headers['authorization']
    var decoded = jwt_decode(bearerHeader)
    if (decoded['role'] == 'student') {
        const bearerToken = bearerHeader.split(' ')[0]
        req.token = bearerToken
        next()
    } else {
        res.send({ error: "Unauthorized" });
    }
}

function verifyTeacherAndStudentToken(req, res, next) {
    const bearerHeader = req.headers['authorization']
    var decoded = jwt_decode(bearerHeader)
    if (decoded['role'] == 'student' || decoded['role'] == 'teacher') {
        const bearerToken = bearerHeader.split(' ')[0]
        req.token = bearerToken
        next()
    } else {
        res.send({ error: "Unauthorized" });
    }
}

// *******************************************************************************************************
// Verify Token END
// *******************************************************************************************************



// *******************************************************************************************************
//  PDF START
// *******************************************************************************************************

router.get('/allfiles', verifyTeacherAndStudentToken, async (req, res, next) => {
    var files = await fs.readdirSync(dir)
    console.log(files)
    if (files.length == 0) {
        res.send({ files: 'No Pdf yet' })
    } else {
        res.send({ files: files })
    }
});

router.get('/readfile/:file', verifyTeacherAndStudentToken, async (req, res, next) => {
    fs.readFile('uploads/' + req.params.file, function read(err, data) {
        if (err) {
            throw err;
        }
        res.send({ files: data })
    });
});

router.get('/deletefile/:file', verifyTeacherToken, async (req, res, next) => {
    var deletefile = fs.unlinkSync('uploads/' + req.params.file)
    console.log(deletefile)
    res.send({ result: 'Success' })
});

router.post('/upload', async (req, res) => {
    console.log(req.files);
    var file = req.files.file_upload
    var filename = file.name
    await file.mv(dir + '/' + filename, function (err) {
        if (err) {
            res.send({ error: err })
        } else {
            res.send({ result: "File Uploaded" })
        }
    })
});

// *******************************************************************************************************
//  PDF ENDS
// *******************************************************************************************************


//create a user
router.post('/register', function (req, res, next) {
    sqldb_Web_App.createUser(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => console.log(error));
});

//login a user
router.post('/login', function (req, res, next) {
    sqldb_Web_App.loginUser(req)
        .then(result => {
            let token = jwt.sign(result.dataValues, process.env.SECRETE_KEY, {
                expiresIn: 5440//dimiourgw to token
            })
            res.send({ userdetails: result.dataValues, token: token });
        })
        .catch(error => res.json({
            error: "Wrong username or password"
        }));
});

//edit a user
router.put('/editprofile/:userid', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.editUser(req)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => error => console.log(error));
});

//get all users
router.get('/allusers', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.getAllUsers(req, res)
        .then(result => {
            if (result.length != 0)
                res.send({ users: result });
            else
                res.json({
                    error: "There aren't users"
                })
        }).catch(error =>
            res.json({
                error: "There aren't users"
            }));
});

/*************************************/
//Einai ta calls gia to reset password
router.get('/findUser/:username', async (req, res, next) => {
    sqldb_Web_App.findUser(req, res)
        .then(result => {
            if (result.length != 0)
                res.send({ result: result });
            else
                res.json({
                    error: "There ins't this user"
                })
        }).catch(error =>
            console.log(error));
});
router.put('/resetpassword/:userid/:code', async (req, res, next) => {
    sqldb_Web_App.resetPassword(req)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => error => console.log(error));
});
/********************************************/

//Edw tha deixnei ton pinaka me to profile kathe xristi
router.get('/profile/:userid', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.showProfileOfUser(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => error => res.json({
            error: error
        }));
});

//Edw tha deixnei ta sinolika score kathe xristi
router.get('/scores/:userid', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.scoreOfOneUser(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => error => res.json({
            error: error
        }));
});

//Edw tha deixnei ta sinolika rate kathe xristi
router.get('/rates/:userid', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.rateOfOneUser(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => error => res.json({
            error: error
        }));
});

//Edw tha deixnei ton pinaka me ta sinolika score kathe xristi
router.get('/bestscores/:category', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.bestScoresOfAllUsers(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => error => console.log(error));
});

//add a score
router.post('/addascore/:userid', verifyStudentToken, async (req, res, next) => {
    sqldb_Web_App.addScore(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => res.json({
            error: error
        }));
});

//add a rate
router.post('/addarate/:userid', verifyStudentToken, async (req, res, next) => {
    sqldb_Web_App.addRate(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => res.json({
            error: error
        }));
});

//get all questions by difficulty
router.get('/getquestions/:difficulty', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.getQuestionsByDifficulty(req, res)
        .then(result => {
            if (result.length != 0)
                res.send({ questions: result });
            else
                res.json({
                    error: "There aren't questions"
                })
        }).catch(error =>
            console.log(error));
});

//get all questions by difficulty
router.get('/get15quizquestions/:difficulty', verifyStudentToken, async (req, res, next) => {
    sqldb_Web_App.get15QuizQuestionsByDifficulty(req, res)
        .then(result => {
            if (result.length != 0)
                res.send({ questions: result });
            else
                res.json({
                    error: "There aren't questions"
                })
        }).catch(error =>
            console.log(error));
});

//get all questions by difficulty
router.get('/get25quizquestions/:difficulty', verifyStudentToken, async (req, res, next) => {
    sqldb_Web_App.get25QuizQuestionsByDifficulty(req, res)
        .then(result => {
            if (result.length != 0)
                res.send({ questions: result });
            else
                res.json({
                    error: "There aren't questions"
                })
        }).catch(error =>
            console.log(error));
});

//add a question
router.post('/addquestion', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.addQuestion(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => res.json({
            error: error
        }));
});

//update a question
router.put('/editquestion/:questionid', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.editSqlQuestion(req)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => error => console.log(error));
});

//delete a question
router.delete('/question/:questionid', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.deleteSqlQuestion(req)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => error => console.log(error));
});

//create a table through web app with SQL QUERY
router.post('/createTable', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.createTable(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => res.json({
            error: error
        }));
});

//get all tables which edited from teachers written with SQL QUERY
router.get('/getalltables', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.getAllTeachersTables(req, res)
        .then(result => {
            if (result.length != 0)
                res.send({ result: result });
            else
                res.json({
                    error: "There aren't tables"
                })
        }).catch(error =>
            console.log(error));
});

//get all data from a table which edited from teachers written with SQL QUERY
router.post('/getaldataofatable', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.getAllDataFromATable(req, res)
        .then(result => {
            if (result.length != 0)
                res.send({ result: result });
            else
                res.json({
                    error: "There aren't data"
                })
        }).catch(error =>
            console.log(error));
});

//delete a table which edited from teachers written with SQL QUERY
router.post('/deleteatable', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.deleteATable(req, res)
        .then(result => {
            if (result.length != 0)
                res.send({ result: result });
            else
                res.json({
                    error: "Delete not working"
                })
        }).catch(error =>
            res.send({ error: error }));
});

//add random queries
router.post('/addarrayofqueries', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.addRandomSqlQueries(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => console.log(error));
});

//add random queries true or false
router.post('/addarrayofqueriestrueorfalse', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.addRandomSqlQueriesTrueOrFalse(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => console.log(error));
});

//get all random queries about specific table 
router.post('/getallsqlqueriesfromspecifictable', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.getSqlRandomQueriesForSpecificTable(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => console.log(error));
});

//get all random queries true or false about specific table 
router.post('/getallsqlqueriestrueorfalsefromspecifictable', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.getSqlRandomQueriesTrueOrFalseForSpecificTable(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => console.log(error));
});

//delete all random queries and true or false about specific table
router.delete('/deleteallsqlqueriesfromspecifictable/:tablename', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.deleteSqlRandomQueriesForSpecificTable(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => console.log(error));
});


//update one random query about specific table
router.put('/updateonesqlqueryfromspecifictable/:id', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.updateSqlRandomQueryForSpecificTable(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch( error => res.json({
            error: error
        }));
});

//update one random query true or false about specific table
router.put('/updateonesqlquerytrueorfalsefromspecifictable/:id', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.updateSqlRandomQueryTrueOrFalseForSpecificTable(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch( error => res.json({
            error: error
        }));
});

//delete one random query about specific table
router.delete('/deleteonesqlqueryfromspecifictable/:id', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.deleteSqlRandomQueryForSpecificTable(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => res.json({
            error: error
        }));
});

//delete one random query true or false about specific table
router.delete('/deleteonesqlquerytrueorfalsefromspecifictable/:id', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.deleteSqlRandomQueryTrueOrFalseForSpecificTable(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => res.json({
            error: error
        }));
});

//add one random queriy about specific table
router.post('/addonesqlqueryfromspecifictable', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.addSqlRandomQueryForSpecificTable(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => res.json({
            error: error
        }));
});

//add one random query true or false about specific table
router.post('/addonesqlquerytrueorfalsefromspecifictable', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.addSqlRandomQueryTrueOrFalseForSpecificTable(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => res.json({
            error: error
        }));
});

//execute a sql query to dynamic tables
router.post('/executesqlquery', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.executeSQLQuery(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => res.json({
            error: error
        }));
});

//execute a sql query to from Student and check  if exists in Test
router.post('/executesqlquerystudent', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.executeSQLQueryFromStudent(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => res.json({
            error: error
        }));
});

//get all fillfieldquestions
router.get('/getallfillfieldquestions', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.getAllFillFieldQuestions(req, res)
        .then(result => {
            if (result.length != 0)
                res.send({ questions: result });
            else
                res.json({
                    error: "There aren't questions"
                })
        }).catch(error =>
            console.log(error));
});

//get one fillfieldquestions by id
router.get('/getonefillfieldquestions/:id', verifyTeacherAndStudentToken, async (req, res, next) => {
    sqldb_Web_App.getOneFillFieldQuestions(req, res)
        .then(result => {
            if (result.length != 0)
                res.send({ questions: result });
            else
                res.json({
                    error: "There aren't questions"
                })
        }).catch(error =>
            console.log(error));
});

//add new question and hide word into fill_field_questions
router.post('/addfillfieldquestion', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.addFillFieldQuestion(req, res)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => res.json({
            error: error
        }));
});

//update a fillfieldquestion
router.put('/editfillfieldquestion/:questionid', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.editFillFieldQuestion(req)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => error => console.log(error));
});

//delete a fillfieldquestion
router.delete('/deletefillfieldquestion/:questionid', verifyTeacherToken, async (req, res, next) => {
    sqldb_Web_App.deleteFillFieldQuestion(req)
        .then(result => {
            res.send({ result: result });
        })
        .catch(error => error => console.log(error));
});

module.exports = router;