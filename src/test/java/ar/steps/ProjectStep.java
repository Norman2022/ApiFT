package ar.steps;

import ar.validator.ProjectValidator;
import com.crowdar.core.PageSteps;

import io.cucumber.java.en.Then;
import services.*;

public class ProjectStep extends PageSteps{

    ProjectValidator validator = new ProjectValidator();
     @Then("se valida la cantidad de projects")
    public void seValidaLaCantidadDeProjects() {
         validator.validate();
    }


    @Then("el project con el nombre {string} se encuentra en la lista")
    public void elProjectConElNombreNombreSeEncuentraEnLaLista(String nombre) {
         validator.validateNombresEsperado(nombre);
    }
}


