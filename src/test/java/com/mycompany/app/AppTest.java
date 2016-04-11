package com.mycompany.app;

import org.junit.Assert;
import org.junit.Test;

/**
 * @author Alexey Z
 */
public class AppTest {
    @Test
    public void testMethod1() throws Exception {
        App app = new App();
        Assert.assertEquals(app.method1(5), "Less than 7");
    }

    @Test
    public void testDoIt() throws Exception {

    }

}