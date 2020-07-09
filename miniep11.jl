using Test

function testPalindromo()
    @test palindromo("") == true
    @test palindromo("ovo") == true
    @test palindromo("joçoj") == true
    @test palindromo("jabanete") == false
    @test palindromo("maoeoam") == true
    @test palindromo("maoekoam") == false
    @test palindromo("MiniEP11") == false
    @test palindromo("A mãe te ama.") == true
    @test palindromo("                       ") == true
    @test palindromo("Socorram-me, subi no ônibus em Marrocos!") == true
    @test palindromo("Passei em MAC0110!") == false
    @test palindromo("aBcDeFgHiJkLmNoPqRsTuVWxYz!-?:331''''") == false
    @test palindromo("Á.À,Ã;É:Í'Ó-Õ?Ú!Ç Ú--ÕÓÍ:::É;,;,Ã!-?À'''Á!") == true
    @test palindromo("O romano acata amores a damas amadas e Roma ataca o namoro.") == true
    @test palindromo("Luza Rocelina, a namorada do Manuel, leu na moda da Romana: anil é cor azul.") == true
    @test palindromo("O duplo pó do trote torpe de potro meu que morto pede protetor todo polpudo.") == true
    @test palindromo("A filha da xuxa se chama sasha, ela tem uma casa com chão sujo, pois a sasha fez xixi no chão da sala") == false
    println("OK")
end

function clearString(string)

    cleanString = lowercase(string)
    cleanString = replace.(cleanString, r"[' ']" => "")
    if sizeof(cleanString) == 0
        return ""
    end
    cleanString = replace.(cleanString, r"[.,;:'-?!]" => "")
    cleanString = replace.(cleanString, r"[áâãà]" => "a")
    cleanString = replace.(cleanString, r"[éêẽè]" => "e")
    cleanString = replace.(cleanString, r"[íîĩì]" => "i")
    cleanString = replace.(cleanString, r"[óôõò]" => "o")
    cleanString = replace.(cleanString, r"[úûũù]" => "u")
    cleanString = replace.(cleanString, r"[ç]" => "c")

    return cleanString
end

function palindromo(string)

    string = clearString(string)

    if sizeof(string) > 0

        for index in firstindex(string) : div(sizeof(string),2) + 1
            if string[index] != string[sizeof(string) - index + 1]
              return false
            end
        end

    end

    return true

end

testPalindromo()
