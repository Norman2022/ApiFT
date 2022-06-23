Feature: El usuario interactura con los Time Entries de Clockify


  Scenario Outline: Consultar las Horas registradas
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
    Then el Time Entry con el nombre '<nombre>' se encuentra en la lista
    Examples:
      | operation | entity    | jsonName   | status |  | nombre          |
      | GET       | TIMEENTRY | project/rq | 200    |  | PruebaTimeEntry |
      | GET       | TIMEENTRY | project/rq | 200    |  | testing         |





  Scenario Outline: Agregar Horas a un proyecto con mas parametros
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and 'description:<nombre>'
    And se obtuvo el status code <status>
    When I perform a 'GET' to '<entity>' endpoint with the 'project/rq' and ''
    Then el Time Entry con el nombre '<nombre>' se encuentra en la lista
    Examples:
      | operation | entity    | jsonName             | status |  | nombre    |  |
      | POST      | TIMEENTRY | project/rq_postParam | 201    |  | TestTime  |  |
      | POST      | TIMEENTRY | project/rq_postParam | 201    |  | TestTime1 |  |
      | POST      | TIMEENTRY | project/rq_postParam | 201    |  | TestTime2 |  |



  Scenario Outline: Update a un time Entry  con su id cambiando su name con parametros
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and 'nombre:<nombreNuevo>,id:<id>'
    And se obtuvo el status code <status>
    When I perform a 'GET' to '<entity>' endpoint with the 'project/rq' and ''
    And se obtuvo el status code <status>
    Then el Time Entry con el nombre '<nombreNuevo>' se encuentra en la lista
    Examples:
      | operation | entity    | jsonName            | status |  | nombreNuevo | id                       |
      | PUT       | TIMEENTRY | project/rq_putParam | 200    |  | TestTime100 | 62b4a93e2296cc448ab70525 |
      | PUT       | TIMEENTRY | project/rq_putParam | 200    |  | TestTime101 | 62b4a93e616f443a3e092b69 |
      | PUT       | TIMEENTRY | project/rq_putParam | 200    |  | TestTime102 | 62b4a93e2296cc448ab70521 |


  @Success
  Scenario Outline: Eliminar un Time Entry por su Id con parametros
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and 'id:<idTimeEntry>'
    And se obtuvo el status code <status>
    When I perform a 'GET' to '<entity>' endpoint with the 'project/rq' and ''
    Then el Time Entry con el nombre '<nombre>' no se encuentra en la lista

    Examples:
      | operation | entity    | jsonName               | status | nombre       | idTimeEntry              |
      | DELETE    | TIMEENTRY | project/rq_deleteParam | 204    | TimeEntry100 | 62b4a93e2296cc448ab70521 |
      | DELETE    | TIMEENTRY | project/rq_deleteParam | 204    | TimeEntry101 | 62b4a93e616f443a3e092b69 |
      | DELETE    | TIMEENTRY | project/rq_deleteParam | 204    | TimeEntry102 | 62b4a93e2296cc448ab70525 |