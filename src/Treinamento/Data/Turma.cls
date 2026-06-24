Class Treinamento.Data.Turma Extends (%Persistent, %XML.Adaptor)
{

Property Instrutor As Treinamento.Data.Instrutor [ SqlColumnNumber = 2 ];

Property DataInicio As %DateTime [ SqlColumnNumber = 3 ];

Property Status As %String [ SqlColumnNumber = 4 ];

Property Alunos As list Of Treinamento.Data.Aluno [ SqlColumnNumber = 5 ];

Property Curso As Treinamento.Data.Curso [ SqlColumnNumber = 6 ];


Method VerificaStatus(curso As %String) As %String 
 {
    Set status = $$$OK
    Set statusTurma = ""
    Set sql = "SELECT * FROM Treinamento_Data.Turma where Curso-> Nome = '"_curso_"'"
    set resultSet = ##class(%ResultSet).%New()
    Set status = resultSet.Prepare(sql)
    Set status = resultSet.Execute()

    While resultSet.%Next() {
        
       // Set statusTurma = resultSet.%Get("Status")

        Set idTurma = resultSet.%Get("ID") 
        Set turma= ##class(Treinamento.Data.Turma).%OpenId(idTurma)
        Set statusTurma = turma.Status
    }

    return statusTurma
 }

ClassMethod ImprimeTurma(curso As %String) As %Status
 {
    Set status = $$$OK    
    try 
    {
        Set sql = "SELECT * FROM Treinamento_Data.Turma where Curso-> Nome = '"_curso_"'"
        set resultSet = ##class(%ResultSet).%New()
        
        Set status = resultSet.Prepare(sql)
        if $SYSTEM.Status.IsError(status) return status

        Set status = resultSet.Execute()
        if $SYSTEM.Status.IsError(status) return status

        If resultSet.%Next()
        {
            Set idTurma = resultSet.%Get("ID") 
            Set turma= ##class(Treinamento.Data.Turma).%OpenId(idTurma)
        }
        For i=1:1:turma.Alunos.Count()
            {
                Set aluno = turma.Alunos.GetAt(i)
                W "Nome " _ aluno.Nome, " Matricula: "_aluno.Matricula, " Idade: "_aluno.Idade, !
            }     
    
    } 
    catch(exception)  
    {
      Set status = ex.AsStatus()
      Throw exception
    
    }
    return 
 }
 

Storage Default
{
<Data name="TurmaDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Instrutor</Value>
</Value>
<Value name="3">
<Value>DataInicio</Value>
</Value>
<Value name="4">
<Value>Status</Value>
</Value>
<Value name="5">
<Value>Alunos</Value>
</Value>
<Value name="6">
<Value>Curso</Value>
</Value>
</Data>
<DataLocation>^Treinamento.Data.TurmaD</DataLocation>
<DefaultData>TurmaDefaultData</DefaultData>
<IdLocation>^Treinamento.Data.TurmaD</IdLocation>
<IndexLocation>^Treinamento.Data.TurmaI</IndexLocation>
<StreamLocation>^Treinamento.Data.TurmaS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
