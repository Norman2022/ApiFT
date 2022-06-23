Feature: El usuario interactura con los Time Entries de Clockify


  Scenario Outline: Consultar las Horas registradas
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
    Then el Time Entry con el nombre '<nombre>' se encuentra en la lista
    Examples:
      | operation | entity    | jsonName   | status |  | nombre          |
      | GET       | TIMEENTRY | project/rq | 200    |  | PruebaTimeEntry |
      | GET       | TIMEENTRY | project/rq | 200    |  | testing         |



  Scenario Outline: Agregar Horas a un proyecto
    When I perform a 'POST' to '<entity>' endpoint with the 'project\rq_post' and ''
    And se obtuvo el status code <status>
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    Then el Time Entry con el nombre '<nombre>' se encuentra en la lista
    Examples:
      | operation | entity    | jsonName   | status |  | nombre   |
      | GET       | TIMEENTRY | project/rq | 201    |  | TestTime |






  Scenario Outline: Update a un time Entry  con su id cambiando su name
    When I perform a 'PUT' to '<entity>' endpoint with the 'project\rq_put' and ''
    And se obtuvo el status code <status>
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
    Then el Time Entry con el nombre '<nombre>' se encuentra en la lista
    Examples:
      | operation | entity    | jsonName   | status |  | nombre      |
      | GET       | TIMEENTRY | project/rq | 200    |  | TestTime100 |




  Scenario Outline: Eliminar un Time Entry por su Id
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
    When I perform a 'GET' to '<entity>' endpoint with the 'project/rq' and ''
    Then el Time Entry con el nombre '<nombre>' no se encuentra en la lista

    Examples:
      | operation | entity    | jsonName          | status | nombre       |
      | DELETE    | TIMEENTRY | project/rq_delete | 204    | TimeEntry100 |


