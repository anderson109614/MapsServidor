const express = require('express');
const router = express.Router();

const mysqlConnection  = require('../database.js');

// GET all dispositivos
router.get('/dispositivos', (req, res) => {
  mysqlConnection.query('SELECT * FROM dispositivos', (err, rows, fields) => {
    if(!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });  
});

// GET An dispositivos id
router.get('/dispositivos/:id', (req, res) => {
  const { id } = req.params; 
  mysqlConnection.query('SELECT * FROM dispositivos WHERE Id = ?', [id], (err, rows, fields) => {
    if (!err) {
      res.json(rows[0]);
    } else {
      console.log(err);
    }
  });
});

// GET An ruta dispositivos id,fecha
router.get('/ruta/:id&:fecha', (req, res) => {
  const { id,fecha } = req.params; 
  mysqlConnection.query(`SELECT
  Latitud,
  Longitud
FROM
  posiciones
WHERE
  Id_Dis =? AND 
Fecha  BETWEEN DATE_FORMAT(?,"%Y-%m-%d 00:00:00")
 AND  DATE_FORMAT(?,"%Y-%m-%d 23:59:59") `, [id,fecha,fecha], (err, rows, fields) => {
    if (!err) {
      res.json(rows);
    } else {
      console.log(err);
    }
  });
});

// DELETE An Employee
router.delete('/dispositivos/:id', (req, res) => {
  const { id } = req.params;
  mysqlConnection.query('DELETE FROM dispositivos WHERE Id = ?', [id], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Employee Deleted'});
    } else {
      console.log(err);
    }
  });
});

// INSERT An Employee
router.post('/dispositivos', (req, res) => {
 
    console.log( req.body);
    const {UUID, manufacture, model} = req.body;
  //console.log(id, name, salary);
  const query = `INSERT INTO dispositivos(
      Fecha,
      UUID, 
      manufacture, 
      model) 
      VALUES(NOW(),?,?, ?);
  `;


  mysqlConnection.query(query, [UUID, manufacture, model], (err, rows, fields) => {
    if(!err) {
      res.json({id: rows.insertId});
    } else {
      console.log(err);
    }
  });
 
  

});
//actulizar
router.put('/dispositivos/:id', (req, res) => {
  const { name, salary } = req.body;
  const { id } = req.params;
  const query = `
  `;
  mysqlConnection.query(query, [id, name, salary], (err, rows, fields) => {
    if(!err) {
      res.json({status: 'Employee Updated'});
    } else {
      console.log(err);
    }
  });
});

module.exports = router;