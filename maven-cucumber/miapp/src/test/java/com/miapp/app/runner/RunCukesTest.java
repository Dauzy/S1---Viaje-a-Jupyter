package com.miapp.app.runner;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;
import org.junit.runner.RunWith;

@RunWith(Cucumber.class)
@CucumberOptions(
        format = {"pretty", "html:target/cucumber"},
        glue = "com.miapp.app.steps",
        features = "classpath:calculadora.feature"
        )
public class RunCukesTest {
}
