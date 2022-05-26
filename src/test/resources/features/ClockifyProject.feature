Feature: Workspace
  COMO usuario de Clockify
  QUIERO ver las configuraciones de mi Worckspace
  PARA llevar un buen control de mis horas de trabajo y el de mis empleados


  Scenario Outline: Consulta Project resultado exitoso
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>

    Examples:
      | operation | entity  | jsonName   | status |  |
      | GET       | PROJECT | project/rq | 200    |  |


  @prueba
  Scenario Outline: Consulta Project resultado exitoso con parametros
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and 'key:<key>,workspace:<workspace>'
    And se obtuvo el status code <status>
    Examples:
      | operation | entity        | jsonName         | status | key                                              | workspace                |
      | GET       | PROJECT_PARAM | project/rq_param | 200    | OWVjYTc1MGItMmQ3Yi00ZmYwLTg0MDgtMWQ1MWE2MGIzNDZl | 6284190cbf8ca01b7b85a380 |


  Scenario Outline: Consulta Project resultado exitoso con validacion
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
    Then se valida la cantidad de projects
    Examples:
      | operation | entity  | jsonName   | status |  |
      | GET       | PROJECT | project/rq | 200    |  |


  #noAnda
  Scenario Outline: Consulta Project resultado: Status 401
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
   # Then se obtuvo el response esperado en <entity> con el <response>
    @Workspace
    Examples:
      | operation | entity | jsonName       | status | response       |
      | GET       | ERROR  | project/rq_401 | 401    | project/rs_401 |


  Scenario Outline: Consulta un Project existente y otro inexistente por el nombre
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
    Then el project con el nombre '<nombre>' se encuentra en la lista
    Examples:
      | operation | entity  | jsonName   | status |  | nombre   |
      | GET       | PROJECT | project/rq | 200    |  | Prueba1  |
      | GET       | PROJECT | project/rq | 200    |  | Prueba10 |
#FALLA la prueba con Prueba10 pues no existe


#cambio el name de un projecto por medio de su id,  en rq_json
# y consulto que se modifica pasando el parametro nombre(My_Project)
  Scenario Outline: Update a un Project  con su id cambiando su name
    When I perform a 'PUT' to '<entity>' endpoint with the 'project\rq_put' and ''
    And se obtuvo el status code <status>
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
    Then se valida la cantidad de projects
    Then el project con el nombre '<nombre>' se encuentra en la lista
    Examples:
      | operation | entity  | jsonName   | status |  | nombre     |
      | GET       | PROJECT | project/rq | 200    |  | My_Project |




  #solo consulta un project por su id
  Scenario Outline: Consulta Project por Id con resultado exitoso
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
    Examples:
      | operation | entity      | jsonName           | status |  |
      | GET       | PROJECTBYID | project/rq_getById | 200    |  |




