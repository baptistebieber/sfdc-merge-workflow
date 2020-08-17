<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Another_alert</fullName>
        <description>Another alert</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <recipients>
            <field>Contact__c</field>
            <type>contactLookup</type>
        </recipients>
        <recipients>
            <field>Email__c</field>
            <type>email</type>
        </recipients>
        <template>TestEmail/Email Test</template>
    </alerts>
    <fieldUpdates>
        <fullName>Enum_Field_Update</fullName>
        <description>Blah</description>
        <field>EnumField__c</field>
        <name>Enum Field Update</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>NextValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Enum_Field_Update2</fullName>
        <description>Blah</description>
        <field>EnumField__c</field>
        <literalValue>PLX2</literalValue>
        <name>Enum Field Update2</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Field_Update</fullName>
        <description>TestField update desc</description>
        <field>Name</field>
        <formula>Name &amp; &quot;Updated&quot;</formula>
        <name>Field Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Lookup_On_Contact</fullName>
        <field>RealOwner__c</field>
        <lookupValue>admin@acme.com</lookupValue>
        <name>Lookup On Contact</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <outboundMessages>
        <fullName>Another_Outbound_message</fullName>
        <description>Another Random outbound.</description>
        <endpointUrl>http://www.test.com</endpointUrl>
        <fields>Email__c</fields>
        <fields>Id</fields>
        <fields>Name</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>admin@acme.com</integrationUser>
        <name>Another Outbound message</name>
        <protected>false</protected>
    </outboundMessages>
    <rules>
        <fullName>BooleanFilter</fullName>
        <active>false</active>
        <booleanFilter>1 AND 2 OR 3</booleanFilter>
        <criteriaItems>
            <field>CustomObjectForWorkflow__c.CreatedById</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>CustomObjectForWorkflow__c.CreatedById</field>
            <operation>notEqual</operation>
            <value>abc</value>
        </criteriaItems>
        <criteriaItems>
            <field>CustomObjectForWorkflow__c.CreatedById</field>
            <operation>equals</operation>
            <value>xyz</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Custom Rule1</fullName>
        <actions>
            <name>Another_alert</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Enum_Field_Update2</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Field_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Another_Outbound_message</name>
            <type>OutboundMessage</type>
        </actions>
        <actions>
            <name>Role_task_was_completed</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>CustomObjectForWorkflow__c.Name</field>
            <operation>startsWith</operation>
            <value>ABC</value>
        </criteriaItems>
        <description>Custom Rule1 desc</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>IsChangedFunctionRule</fullName>
        <active>true</active>
        <description>IsChangedDesc</description>
        <formula>ISCHANGED(Name)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>Another_task_was_completed</fullName>
        <assignedToType>owner</assignedToType>
        <description>Random Comment</description>
        <dueDateOffset>20</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <priority>High</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Another task was completed</subject>
    </tasks>
    <tasks>
        <fullName>Role_task_was_completed</fullName>
        <assignedTo>R11</assignedTo>
        <assignedToType>role</assignedToType>
        <dueDateOffset>-2</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>CustomObjectForWorkflow__c.CreatedDate</offsetFromField>
        <priority>High</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>Role task was completed</subject>
    </tasks>
    <tasks>
        <fullName>User_task_was_completed</fullName>
        <assignedTo>admin@acme.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>-2</dueDateOffset>
        <notifyAssignee>true</notifyAssignee>
        <offsetFromField>User.CreatedDate</offsetFromField>
        <priority>High</priority>
        <protected>false</protected>
        <status>Completed</status>
        <subject>User task was completed</subject>
    </tasks>
</Workflow>
