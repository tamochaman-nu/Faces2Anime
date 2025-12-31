import torch
import torchinfo

if __name__ == "__main__":
    model = torch.load("./model/pretrained/ffhq512_pretrained.pth")
    torchinfo.summary(model)