{
  "spriteId": {
    "name": "spr_pot",
    "path": "sprites/spr_pot/spr_pot.yy",
  },
  "solid": false,
  "visible": true,
  "spriteMaskId": null,
  "persistent": false,
  "parentObjectId": {
    "name": "obj_parentEntity",
    "path": "objects/obj_parentEntity/obj_parentEntity.yy",
  },
  "physicsObject": false,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsGroup": 1,
  "physicsDensity": 0.5,
  "physicsRestitution": 0.1,
  "physicsLinearDamping": 0.1,
  "physicsAngularDamping": 0.1,
  "physicsFriction": 0.2,
  "physicsStartAwake": true,
  "physicsKinematic": false,
  "physicsShapePoints": [],
  "eventList": [
    {"isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
  ],
  "properties": [],
  "overriddenProperties": [
    {"propertyId":{"name":"ENTITY_ACTIVATE_SCRIPT","path":"objects/obj_parentEntity/obj_parentEntity.yy",},"objectId":{"name":"obj_parentEntity","path":"objects/obj_parentEntity/obj_parentEntity.yy",},"value":"ActivateLiftable","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"ENTITY_ACTIVATE_ARGS","path":"objects/obj_parentEntity/obj_parentEntity.yy",},"objectId":{"name":"obj_parentEntity","path":"objects/obj_parentEntity/obj_parentEntity.yy",},"value":"[id]","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"ENTITY_HIT_SCRIPT","path":"objects/obj_parentEntity/obj_parentEntity.yy",},"objectId":{"name":"obj_parentEntity","path":"objects/obj_parentEntity/obj_parentEntity.yy",},"value":"EntityHitDestroy","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"ENTITY_THROW_BREAK","path":"objects/obj_parentEntity/obj_parentEntity.yy",},"objectId":{"name":"obj_parentEntity","path":"objects/obj_parentEntity/obj_parentEntity.yy",},"value":"True","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"ENTITY_FRAGMENT","path":"objects/obj_parentEntity/obj_parentEntity.yy",},"objectId":{"name":"obj_parentEntity","path":"objects/obj_parentEntity/obj_parentEntity.yy",},"value":"obj_fragPot","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"ENTITY_FRAGMENT_COUNT","path":"objects/obj_parentEntity/obj_parentEntity.yy",},"objectId":{"name":"obj_parentEntity","path":"objects/obj_parentEntity/obj_parentEntity.yy",},"value":"3 + irandom(2)","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
  ],
  "parent": {
    "name": "Objects",
    "path": "folders/Objects.yy",
  },
  "resourceVersion": "1.0",
  "name": "obj_pot",
  "tags": [],
  "resourceType": "GMObject",
}