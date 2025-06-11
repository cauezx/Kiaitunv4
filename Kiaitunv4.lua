-- Kaitun V4 - Automação Blox Fruits para Arceus Executor
-- Autor: cauezin (adaptado)
-- Suporta: Join server, farm frags, upgrade raças, comprar cyborg/ghoul, random fruit, etc.

-- Configurações gerais
local config = {
    targetServerFullMoon = true, -- Tenta entrar em servidor Full Moon (pode adaptar)
    selectedGearStop = 4, -- Parar no gear 1~4, 0 para ignorar
    autoFarmFragments = true,
    autoRaceFarmV4 = true, -- Tenta farmar as 6 raças V4, comprar cyborg, ghoul e outras
    autoBuyRaceShop = true,
    autoRandomFruit = true,
    autoUpgradeRaceV1toV3 = true,
    stopWhenAllDone = true,
    requiredFragmentsForNextTrain = 1500,
}

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VirtualUser = game:GetService("VirtualUser")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local MarketplaceService = game:GetService("MarketplaceService")

-- Função para simular clique para evitar desconexão por AFK
local function preventAfk()
    VirtualUser:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end

-- Função para entrar no servidor Full Moon ou outro servidor com função Join
local function joinServerFullMoon()
    -- Coloque aqui sua lógica para buscar servidores e entrar
    -- Como exemplo, pode usar matchmaking no Roblox, mas isso depende do exploit ter suporte
    print("Tentando entrar no servidor Full Moon...")
    -- Placeholder - deve adaptar conforme método de join do exploit
end

-- Função para farmar fragmentos automaticamente
local function autoFarmFragments()
    if not config.autoFarmFragments then return end
    print("Iniciando farm de fragments...")
    -- Exemplo genérico:
    -- Você pode usar teleporte para pontos de fragmentos, atacar mobs, etc.
    -- Lembre-se que o jeito certo depende do jogo e exploits.
end

-- Função para selecionar gear e parar no selecionado
local function selectGearStop()
    local gear = config.selectedGearStop
    if gear == 0 then return end
    print("Gear stop selecionado: ".. gear)
    -- Aqui você pode aplicar o gear no jogador e impedir upgrade depois
end

-- Função para farmar as 6 raças V4 e comprar Cyborg/Ghoul
local function farm6RacesV4()
    if not config.autoRaceFarmV4 then return end
    print("Farmando 6 raças V4 com upgrades e compra Cyborg/Ghoul...")
    -- Processo automático:
    -- 1) Farmar fragmentos até necessário
    -- 2) Comprar raça via Shop (incluindo Cyborg, Ghoul)
    -- 3) Fazer treinos (trials)
    -- 4) Parar quando todas as raças alcançadas

    -- Pseudo código:
    -- while not todas_raças_completas do
    --    if fragments < required then farmFragments()
    --    buyRaceIfAvailable()
    --    doTrials()
    -- end
end

-- Função para comprar raça Cyborg/Ghoul automaticamente
local function autoBuyRace()
    if not config.autoBuyRaceShop then return end
    print("Tentando comprar Cyborg/Ghoul automaticamente...")
    -- Use Remotes do jogo para comprar as raças, exemplo:
    local raceShop = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("RaceShop") -- Exemplo de nome
    local function buyRace(raceName)
        raceShop:InvokeServer(raceName)
        print("Comprando raça: ".. raceName)
    end
    -- Comprar cyborg e ghoul (exemplo)
    buyRace("Cyborg")
    buyRace("Ghoul")
end

-- Função para selecionar e armazenar frutas aleatórias
local function randomFruitAndStore()
    if not config.autoRandomFruit then return end
    print("Selecionando e armazenando fruta aleatória...")
    -- Pseudo função para comprar fruta random e armazenar no inventário
end

-- Função para upgrade de raças V1 a V3
local function upgradeRaceV1toV3()
    if not config.autoUpgradeRaceV1toV3 then return end
    print("Iniciando upgrade das raças V1~V3...")
    -- Automatizar treino e upgrade com fragmentos
end

-- Função principal para controlar o fluxo da automação
local function mainLoop()
    -- Se quiser, pode usar coroutine para rodar tudo junto

    -- Evitar AFK
    spawn(function()
        while true do
            preventAfk()
            wait(60)
        end
    end)

    -- Tenta entrar no servidor full moon (se ativado)
    if config.targetServerFullMoon then
        joinServerFullMoon()
    end

    -- Seleciona gear para parar
    selectGearStop()

    -- Começa farm e automações principais
    farm6RacesV4()
    autoBuyRace()
    randomFruitAndStore()
    upgradeRaceV1toV3()

    print("Kaitun V4 automação iniciada.")
end

-- Inicializa a automação
mainLoop()
