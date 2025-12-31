import os

from submodules.whitebox_cartoonization.test_code import cartoonize

if __name__ == "__main__":
    model_path = "submodules/whitebox_cartoonization/test_code/saved_models"
    load_image_path = "data/structure"
    save_image_path = "data/cartoonized-structure"

    if not os.path.exists(save_image_path):
        os.mkdir(save_image_path)
    cartoonize.cartoonize(load_image_path, save_image_path, model_path)
