import tqdm
import importlib.util
import sys


# 'test/cartoonize.py'のフルパスを指定
cartoonize_path = 'White-box-Cartoonization/test_code/cartoonize.py'

# モジュールを動的にインポート
spec = importlib.util.spec_from_file_location("cartoonize", cartoonize_path)
cartoonize = importlib.util.module_from_spec(spec)
sys.modules["cartoonize"] = cartoonize
spec.loader.exec_module(cartoonize)

# cartoonize内の関数を使用
cartoonize.cartoonize_function_or_class()