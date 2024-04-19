When defining schemas, the framework expects field and set objects to have the following keys.

Set JSON Object:
```
{
    "token": String,
    "label": String,
    "parent": String, #Existing Set Token String (optional)
    "metadata": JSON #(optional)
}
```

Field JSON Object
```
{
    "token": String,
    "label": String,
    "type": FieldType,
    "parent": String, #Existing Token of field or fieldset if type is defined as fieldset. (optional)
    "values": [Any], #Used for definition of enum type. If enum is declared and values are not defined here, the enum will be caclulated after schmea definition (optional)
    "value": Any, #Default value (optional)
    "store": StoreType,
    "metadata": JSON #(optional)
}
```


FieldSet JSON Object
```
{
    "token": String,
    "label": String,
    "parent": String, #Existing Set Token String (optional)
    "metadata": JSON #(optional)
    "fields": [
        # List of Field Objects
        {
            "token": String,
            "label": String,
            "type": FieldType,
            "parent": String, #Existing Token of field or fieldset if type is defined as fieldset. (optional)
            "values": [Any], #Used for definition of enum type. If enum is declared and values are not defined here, the enum will be caclulated after schmea definition (optional)
            "value": Any, #Default value (optional)
            "store": StoreType,
            "metadata": JSON #(optional)
        }
    ]
}
```


# Enums
Using the non-static data types for `field_type` & `store_type` (`any`, `custom`), the following enums strings are predfeined when defining a schema. You can utilize these strings to return an enum of the current DB data type tokens for `store_type` & `field_type`. This allows us to avoid cases where we have schemas hardcoding a `values` list that needs to be updated every time a custom type is added.

- fieldtype
- storetype