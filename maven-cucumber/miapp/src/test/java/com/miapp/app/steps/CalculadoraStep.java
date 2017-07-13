package com.miapp.app.steps;

import org.junit.Assert;
import com.miapp.app.Calculadora;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class CalculadoraStep {

    private Calculadora calculadora = null;
    private int resultado;

    @Given("^Calculadora inicializada$")
    public void inicializaCalculadora() throws Throwable {
        calculadora = new Calculadora();
    }

    @When("^Se suman los valores (\\d+) y (\\d+)$")
    public void sumaValores(int a, int b) throws Throwable {
        resultado = calculadora.suma(a,b);
    }

    @Then("^El resultado es (\\d+)$")
    public void elResultadoEs(int esperando) throws Throwable {
        Assert.assertEquals(esperando,resultado);
    }

}
