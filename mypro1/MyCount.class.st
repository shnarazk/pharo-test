"
counter object
"
Class {
	#name : #MyCount,
	#superclass : #Object,
	#instVars : [
		'val'
	],
	#category : #mypro1
}

{ #category : #initalize }
MyCount >> new [
	val := 0.
	^ self
]
