Feature: Workspace
  COMO usuario de Clockify
  QUIERO ver las configuraciones de mi Worckspace
  PARA llevar un buen control de mis horas de trabajo y el de mis empleados

  Scenario Outline: Consulta Workspace resultado exitoso
    Given Mi cuenta creada en clockify y mi X-Api-Key geneada
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>
    Then Obtengo los datos de mi Workspace

    Examples:
      | operation | entity    | jsonName     | status |
      | GET       | WORKSPACE | workspace/rq | 200    |


  Scenario Outline: Consulta Workspace resultados erroneos
    Given X-Api-Key invalido
    When I perform a '<operation>' to '<entity>' endpoint with the '<jsonName>' and ''
    And se obtuvo el status code <status>

    Examples:
      | operation | entity | jsonName         | status |
      | GET       | ERROR  | workspace/rq_401 | 401    |
      | GET       | ERROR  | workspace/rq_404 | 404    |
      | GET       | ERROR  | workspace/rq_403 | 403    |



