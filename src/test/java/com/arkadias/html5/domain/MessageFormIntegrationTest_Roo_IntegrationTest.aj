// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.arkadias.html5.domain;

import com.arkadias.html5.domain.MessageFormDataOnDemand;
import com.arkadias.html5.domain.MessageFormIntegrationTest;
import com.arkadias.html5.service.MessageFormService;
import java.util.List;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect MessageFormIntegrationTest_Roo_IntegrationTest {
    
    declare @type: MessageFormIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: MessageFormIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext*.xml");
    
    declare @type: MessageFormIntegrationTest: @Transactional;
    
    @Autowired
    private MessageFormDataOnDemand MessageFormIntegrationTest.dod;
    
    @Autowired
    MessageFormService MessageFormIntegrationTest.messageFormService;
    
    @Test
    public void MessageFormIntegrationTest.testCountAllMessageForms() {
        Assert.assertNotNull("Data on demand for 'MessageForm' failed to initialize correctly", dod.getRandomMessageForm());
        long count = messageFormService.countAllMessageForms();
        Assert.assertTrue("Counter for 'MessageForm' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void MessageFormIntegrationTest.testFindMessageForm() {
        MessageForm obj = dod.getRandomMessageForm();
        Assert.assertNotNull("Data on demand for 'MessageForm' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'MessageForm' failed to provide an identifier", id);
        obj = messageFormService.findMessageForm(id);
        Assert.assertNotNull("Find method for 'MessageForm' illegally returned null for id '" + id + "'", obj);
        Assert.assertEquals("Find method for 'MessageForm' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void MessageFormIntegrationTest.testFindAllMessageForms() {
        Assert.assertNotNull("Data on demand for 'MessageForm' failed to initialize correctly", dod.getRandomMessageForm());
        long count = messageFormService.countAllMessageForms();
        Assert.assertTrue("Too expensive to perform a find all test for 'MessageForm', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        List<MessageForm> result = messageFormService.findAllMessageForms();
        Assert.assertNotNull("Find all method for 'MessageForm' illegally returned null", result);
        Assert.assertTrue("Find all method for 'MessageForm' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void MessageFormIntegrationTest.testFindMessageFormEntries() {
        Assert.assertNotNull("Data on demand for 'MessageForm' failed to initialize correctly", dod.getRandomMessageForm());
        long count = messageFormService.countAllMessageForms();
        if (count > 20) count = 20;
        int firstResult = 0;
        int maxResults = (int) count;
        List<MessageForm> result = messageFormService.findMessageFormEntries(firstResult, maxResults);
        Assert.assertNotNull("Find entries method for 'MessageForm' illegally returned null", result);
        Assert.assertEquals("Find entries method for 'MessageForm' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void MessageFormIntegrationTest.testFlush() {
        MessageForm obj = dod.getRandomMessageForm();
        Assert.assertNotNull("Data on demand for 'MessageForm' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'MessageForm' failed to provide an identifier", id);
        obj = messageFormService.findMessageForm(id);
        Assert.assertNotNull("Find method for 'MessageForm' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyMessageForm(obj);
        Integer currentVersion = obj.getVersion();
        obj.flush();
        Assert.assertTrue("Version for 'MessageForm' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void MessageFormIntegrationTest.testUpdateMessageFormUpdate() {
        MessageForm obj = dod.getRandomMessageForm();
        Assert.assertNotNull("Data on demand for 'MessageForm' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'MessageForm' failed to provide an identifier", id);
        obj = messageFormService.findMessageForm(id);
        boolean modified =  dod.modifyMessageForm(obj);
        Integer currentVersion = obj.getVersion();
        MessageForm merged = messageFormService.updateMessageForm(obj);
        obj.flush();
        Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        Assert.assertTrue("Version for 'MessageForm' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void MessageFormIntegrationTest.testSaveMessageForm() {
        Assert.assertNotNull("Data on demand for 'MessageForm' failed to initialize correctly", dod.getRandomMessageForm());
        MessageForm obj = dod.getNewTransientMessageForm(Integer.MAX_VALUE);
        Assert.assertNotNull("Data on demand for 'MessageForm' failed to provide a new transient entity", obj);
        Assert.assertNull("Expected 'MessageForm' identifier to be null", obj.getId());
        messageFormService.saveMessageForm(obj);
        obj.flush();
        Assert.assertNotNull("Expected 'MessageForm' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void MessageFormIntegrationTest.testDeleteMessageForm() {
        MessageForm obj = dod.getRandomMessageForm();
        Assert.assertNotNull("Data on demand for 'MessageForm' failed to initialize correctly", obj);
        Long id = obj.getId();
        Assert.assertNotNull("Data on demand for 'MessageForm' failed to provide an identifier", id);
        obj = messageFormService.findMessageForm(id);
        messageFormService.deleteMessageForm(obj);
        obj.flush();
        Assert.assertNull("Failed to remove 'MessageForm' with identifier '" + id + "'", messageFormService.findMessageForm(id));
    }
    
}
