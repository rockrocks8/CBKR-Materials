Config = {}

Config.UseBlip = true                      -- [true to enable the blip | false disables the blip]

Config.Location = {
    Coords = vector4(-511.88, -1747.67, 18.23, 236.77),
    ModelName = "s_m_m_gaffer_01",
    ModelHash = 0xA956BD9E,
    SetBlipSprite = 467,
    SetBlipDisplay = 6,
    SetBlipScale = 0.85,
    SetBlipColour = 2,
    BlipName = "Material Dealer"
}

Config.Icons = {
    EyeIcon = "fa-solid fa-face-smile-horns",
    Header = "fa-solid fa-paste",
    Rare = "fa-solid fa-recycle",
    Miscellanceous = "fa-solid fa-recycle"
}

Config.Text = {
    TargetLabel = "Materials Seller",
    PedHeader = "Materials Dealer",
    Rare = "Rare",
    Miscellanceous = "Miscellanceous",
}

Config.RareShop = {
    label = "Rare Materials",
    slots = 10,
    items = {
        [1] = {
            name = "rubber",
            price = 55,
            amount = 200,
            info = {},
            type = "item",
            slot = 1,
        }
    }
}

Config.MiscellanceousShop = {
    label = "Miscellanceous Materials",
    slots = 10,
    items = {
        [1] = {
            name = "glass",
            price = 17,
            amount = 200,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "steel",
            price = 19,
            amount = 200,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "iron",
            price = 21,
            amount = 200,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "aluminum",
            price = 17,
            amount = 200,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "copper",
            price = 20,
            amount = 200,
            info = {},
            type = "item",
            slot = 5,
        },
        [6] = {
            name = "metalscrap",
            price = 19,
            amount = 200,
            info = {},
            type = "item",
            slot = 6,
        },
        [7] = {
            name = "plastic",
            price = 16,
            amount = 200,
            info = {},
            type = "item",
            slot = 7,
        },
    }
}
