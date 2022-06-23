package ar.validator;

import api.model.Project.TimeEntryResponse;
import java.util.List;
import com.crowdar.api.rest.APIManager;
import org.testng.Assert;

public class ProjectValidator {

    public void validate(){
        TimeEntryResponse[] response =(TimeEntryResponse[]) APIManager.getLastResponse().getResponse();
        Assert.assertNotNull(response, "Response es null");
        for (TimeEntryResponse project:response){
            Assert.assertNotNull(project.getId(), "getClienteId es null");
        }

    }
    public void validateNombresEsperado(String nombre){
        TimeEntryResponse[] response =(TimeEntryResponse[]) APIManager.getLastResponse().getResponse();
        boolean flagNombre=false ;
        for (TimeEntryResponse project:response){
            if (project.getDescription().equals(nombre)) flagNombre = true;
        }
        Assert.assertTrue(flagNombre,"El TimeEntry: "+nombre+" no se encuentra en la lista");
    }



    public void validateNombresEliminado(String nombre){
        TimeEntryResponse[] response =(TimeEntryResponse[]) APIManager.getLastResponse().getResponse();
        boolean flagNombre=false ;
        for (TimeEntryResponse project:response){
            if (project.getDescription().equals(nombre)) flagNombre = true;
        }
        Assert.assertFalse(flagNombre,"El TimeEntry: "+nombre+"  se encuentra en la lista");
    }
}
