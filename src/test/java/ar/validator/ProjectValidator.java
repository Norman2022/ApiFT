package ar.validator;

import api.model.Project.ProjectResponse;
import java.util.List;
import com.crowdar.api.rest.APIManager;
import org.testng.Assert;

public class ProjectValidator {

    public void validate(){
        ProjectResponse[] response =(ProjectResponse[]) APIManager.getLastResponse().getResponse();
        Assert.assertNotNull(response, "Response es null");
        for (ProjectResponse project:response){
            Assert.assertNotNull(project.getClientId(), "getClienteId es null");
        }

    }
    public void validateNombresEsperado(String nombre){
        ProjectResponse[] response =(ProjectResponse[]) APIManager.getLastResponse().getResponse();
        boolean flagNombre=false ;
        for (ProjectResponse project:response){
            if (project.getName().equals(nombre)) flagNombre = true;
        }
        Assert.assertTrue(flagNombre,"El projetc: "+nombre+" no se encuentra en la lista");
    }

}
