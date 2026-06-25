Class Treinamento.VO.LogMensagem Extends (%Persistent, %XML.Adaptor)
{

Property Metodo As %String(MAXLEN = "") [ SqlColumnNumber = 2 ];

Property Classe As %String(MAXLEN = "") [ SqlColumnNumber = 3 ];

Property Inicio As %String [ SqlColumnNumber = 4 ];

Property Fim As %String [ SqlColumnNumber = 5 ];

Property Status As %String [ SqlColumnNumber = 6 ];

Property StatusProcesso As %String [ SqlColumnNumber = 7 ];

Storage Default
{
<Data name="LogMensagemDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Metodo</Value>
</Value>
<Value name="3">
<Value>Classe</Value>
</Value>
<Value name="4">
<Value>Inicio</Value>
</Value>
<Value name="5">
<Value>Fim</Value>
</Value>
<Value name="6">
<Value>Status</Value>
</Value>
<Value name="7">
<Value>StatusProcesso</Value>
</Value>
</Data>
<DataLocation>^Treinamento.VO.LogMensagemD</DataLocation>
<DefaultData>LogMensagemDefaultData</DefaultData>
<IdLocation>^Treinamento.VO.LogMensagemD</IdLocation>
<IndexLocation>^Treinamento.VO.LogMensagemI</IndexLocation>
<StreamLocation>^Treinamento.VO.LogMensagemS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
