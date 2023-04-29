# AZ-104
Guia de Estudos do Learning az-104

Link: https://learn.microsoft.com/pt-br/training/browse/?terms=az-104


# Reduncia Zonas Azure
Tipos de Redundancias: 
- LRS:
- ZRS:
- GRS:
- RA-GRS: 
- GZRS:
- RA-GZRS:

# Acesso de leitura aos dados na região secundária

O armazenamento com redundância geográfica (com GRS ou GZRS) replica seus dados para outro local físico na região secundária para proteger contra interrupções regionais. Com uma conta configurada para GRS ou GZRS, os dados na região secundária não são diretamente acessíveis para usuários ou aplicativos, a menos que ocorra um failover. O processo de failover atualiza a entrada DNS fornecida pelo armazenamento do Azure para que o ponto de extremidade secundário se torne o novo ponto de extremidade primário de sua conta de armazenamento. Durante o processo de failover, seus dados são inacessíveis. Após a conclusão do failover, você pode fazer a leitura e gravar dados na nova região primária. Para obter mais informações sobre failover e recuperação de desastre, consulte Como funciona um failover de conta.

Se seus aplicativos exigirem alta disponibilidade, você poderá configurar sua conta de armazenamento para acesso de leitura à região secundária. Quando você habilita o acesso de leitura para a região secundária, seus dados ficam sempre disponíveis para serem lidos a partir da secundária, inclusive nas situações em que a região primária ficar indisponível. A configuração do armazenamento com redundância geográfica com acesso de leitura (RA-GRS) ou o armazenamento com redundância de zona com acesso de leitura (RA-GZRS) permitir acesso de leitura a região secundária.

Link: https://learn.microsoft.com/pt-br/azure/storage/common/storage-redundancy
