//
//  Movie.swift
//  CineFiles
//
//  Created by Longhi on 30/05/25.
//

import Foundation

struct Movie: Identifiable {
    let id = UUID()
    let nome: String
    let ano: Int
    let sinopse: String
    let direcao: String
    let roteiristas: String
    let capaArt: String
    var favorito: Bool = false
    var assistido: Bool = false
}


struct DataModel {
    static var movies: [Movie] = [
        Movie(nome: "Tudo em Todo o Lugar ao Mesmo Tempo",
              ano: 2022,
              sinopse: "Uma imigrante chinesa de meia idade se envolve em uma aventura louca, onde só ela pode salvar o mundo explorando outros universos que se conectam com as vidas que ela poderia ter levado",
              direcao: "Daniel Kwan, Daniel Scheinert",
              roteiristas: "Daniel Kwan, Daniel Scheinert",
              capaArt: "tudo-em-todo-o-lugar-ao-mesmo-tempo"),
        Movie(nome: "Cisne Negro",
              ano: 2010,
              sinopse: "Uma esforçada bailarina luta para manter sua sanidade após obter o papel principal no Lago dos Cisnes de Tchaikovsky.",
              direcao: "Darren Aronofsky",
              roteiristas: "Mark Heyman, Andres Heinz, John J. McLaughlin",
              capaArt: "cisne-negro"),
        Movie(nome: "Barbie a Princesa e a Plebeia",
              ano: 2004,
              sinopse: "Uma plebeia, moradora de um vilarejo, é muito parecida com a princesa do reino. Os destinos das duas se cruzam quando a princesa é sequestrada, e a moça humilde usa sua incrível semelhança com ela para tentar salvar das mãos do vilão.",
              direcao: "William Lau",
              roteiristas: "Cliff Ruby, Elana Lesser, Ruth Handler",
              capaArt: "barbie-a-princesa-e-a-plebeia"),
        Movie(nome: "Show de Truman",
              ano: 1998,
              sinopse: "Truman Burbank é um pacato vendedor de seguros que leva uma vida simples com sua esposa Meryl Burbank. Porém, algumas coisas ao seu redor fazem com que ele passe a estranhar sua cidade, seus supostos amigos e até sua mulher. Após conhecer a misteriosa Lauren, ele fica intrigado e acaba descobrindo que toda sua vida foi monitorada por câmeras e transmitida em rede nacional.",
              direcao: "Peter Weir",
              roteiristas: "Peter Weir, Andrew Niccol",
              capaArt: "show-de-truman"),
        Movie(nome: "Spirit: O Corcel Indomável",
              ano: 2002,
              sinopse: "Animação sobre a amizade entre um menino indígena e um cavalo indomável apaixonado por uma égua. Ambientada no Velho Oeste americano, mostra o impacto do processo civilizatório na vida dos três e também na amizade que construíram.",
              direcao: "Kelly Asbury, Lorna Cook",
              roteiristas: "John Fusco",
              capaArt: "spirit-o-corcel-indomavel"),
        Movie(nome: "Labirinto do Fauno",
              ano: 2006,
              sinopse: "Em 1944, na Espanha, a jovem Ofélia e sua mãe doente chegam ao posto do novo marido de sua mãe, um sádico oficial do exército que está tentando reprimir uma guerrilheira. Enquanto explorava um labirinto antigo, Ofélia encontra o Pan fauno, que diz que a menina é uma lendária princesa perdida e que ela precisa completar três tarefas perigosas a fim de se tornar imortal.",
              direcao: "Guillermo del Toro",
              roteiristas: "Guillermo del Toro",
              capaArt: "labirinto-do-fauno"),
        Movie(nome: "O Predestinado",
              ano: 2015,
              sinopse: "Um agente precisa viajar no tempo para impedir a ação de um criminoso responsável por um ataque que mata milhares de pessoas.",
              direcao: "Michael Spierig, Peter Spierig",
              roteiristas: "Michael Spierig, Peter Spierig, Robert A Heinlein (autor da obra original)",
              capaArt: "o-predestinado"),
        Movie(nome: "Gigantes de Aço",
              ano: 2011,
              sinopse: "Em um futuro próximo, as máquinas substituem os homens no ringue. As lutas de boxe acontecem entre robôs de alta tecnologia. Charlie, um ex-lutador frustrado, decide se juntar ao filho para construir um competidor imbatível.",
              direcao: "Shawn Levy",
              roteiristas: "Dan Gilroy, Les Bohem, Jeremy Leven, John Gatins, Richard Matheson (autor da obra original)",
              capaArt: "gigantes-de-aco"),
        Movie(nome: "A vastidão da Noite",
              ano: 2019,
              sinopse: "Duas crianças procuram a fonte de uma misteriosa frequência que surgiu em sua cidade.",
              direcao: "Andrew Patterson",
              roteiristas: "James Montague, Craig W. Sanger",
              capaArt: "a-vastidao-da-noite"),
        Movie(nome: "Parasita",
              ano: 2019,
              sinopse: "Toda a família de Ki-taek está desempregada, vivendo em um porão sujo e apertado. Por obra do acaso, ele começa a dar aulas de inglês para uma garota de família rica. Fascinados com a vida luxuosa destas pessoas, pai, mãe e filhos bolam um plano para se infiltrar também na abastada família, um a um. No entanto, os segredos e mentiras necessários à ascensão social cobram o seu preço.",
              direcao: "Bong Joon-ho",
              roteiristas: "Bong Joon-ho, Jin Won Han",
              capaArt: "parasita"),
        Movie(nome: "Passivonas",
              ano: 2023,
              sinopse: "Duas alunas não populares do último ano do ensino médio criam um clube da luta para tentar impressionar e conquistar líderes de torcida.",
              direcao: "Emma Seligman",
              roteiristas: "Emma Seligman, Rachel Sennott",
              capaArt: "passivonas"),
        Movie(nome: "Turma da Mônica: Uma Aventura no Tempo",
              ano: 2007,
              sinopse: "Franjinha está construindo uma máquina do tempo e precisa reunir moléculas dos quatro elementos: ar, água, fogo e terra. Mônica joga Sansão e, sem querer, acerta o aparelho, espalhando os elementos. Agora a turma precisa consertá-la.",
              direcao: "Mauricio de Sousa",
              roteiristas: "Mauricio de Sousa, Flávio de Souza, Didi Oliveira, Emerson Bernardo de Abreu",
              capaArt: "turma-da-monica-uma-aventura-no-tempo"),
        Movie(nome: "Amnésia (Memento)",
              ano: 2001,
              sinopse: "Leonard está caçando o homem que estuprou e matou sua esposa. Ele tem dificuldades em encontrar o assassino pois sofre de uma forma intratável de perda de memória. Mesmo que ele possa lembrar detalhes da vida antes do acidente, Leonard não consegue lembrar o que aconteceu quinze minutos atrás, onde está indo ou a razão.",
              direcao: "Christopher Nolan",
              roteiristas: "Christopher Nolan, Jonathan Nolan",
              capaArt: "amnesia-memento"),
        Movie(nome: "Os Excêntricos Tenenbaums",
              ano: 2002,
              sinopse: "Royal e sua esposa Etheline tiveram três filhos muito diferentes entre si, mas igualmente bem-sucedidos. Quando Etheline resolve se casar com outro, o irresponsável e excêntrico Royal resolve lutar por seu amor reunindo toda a família.",
              direcao: "Wes Anderson",
              roteiristas: "Wes Anderson, Owen Wilson",
              capaArt: "os-excentricos-tenenbaums"),
        Movie(nome: "La La Land",
              ano: 2017,
              sinopse: "O pianista Sebastian conhece a atriz Mia, e os dois se apaixonam perdidamente. Em busca de oportunidades para suas carreiras na competitiva Los Angeles, os jovens tentam fazer o relacionamento amoroso dar certo, enquanto perseguem fama e sucesso.",
              direcao: "Damien Chazelle",
              roteiristas: "Damien Chazelle",
              capaArt: "la-la-land"),
        Movie(nome: "Os Serviços de Entrega da Kiki",
              ano: 1990,
              sinopse: "Por ordem de sua mãe, Kiki parte para um aprendizado de um ano, acompanhada por seu gato preto. A um comando de sua vassoura mágica, ela vai parar na charmosa cidadezinha de Moreoastal. Infelizmente, os hotéis locais não aceitam bruxas e a polícia a flagra fazendo algumas travessuras.",
              direcao: "Hayao Miyazaki",
              roteiristas: "Hayao Miyazaki, Jack Fletcher, John Semper",
              capaArt: "os-servicos-de-entrega-da-kiki"),
        Movie(nome: "O Feitiço de Áquila",
              ano: 1985,
              sinopse: "O ladrão Gaston escapa da masmorra medieval de Aquila através da latrina. Os soldados estão prestes a matá-lo quando Navarra o salva. Navarra, viajando com seu falcão animado, planeja matar o bispo de Áquila com a ajuda de Gaston.",
              direcao: "Richard Donner",
              roteiristas: "Michael Thomas, Tom Mankiewicz",
              capaArt: "o-feitico-de-aquila"),
        Movie(nome: "Os Incríveis",
              ano: 2004,
              sinopse: "Depois do governo banir o uso de superpoderes, o maior herói do planeta, o Sr. Incrível, vive de forma pacata com sua família. Apesar de estar feliz com a vida doméstica, o Sr. Incrível ainda sente falta dos tempos em que viveu como super-herói, e sua grande chance de entrar em ação novamente surge quando um velho inimigo volta a atacar. Só que agora ele precisa contar com a ajuda de toda a família para vencer o vilão.",
              direcao: "Brad Bird",
              roteiristas: "Brad Bird",
              capaArt: "os-incriveis")
    ].sorted(by: { $0.nome < $1.nome })
}
