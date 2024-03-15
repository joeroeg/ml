import json

class Tokenizer: # This is the base class for all tokenizers.
    def __init__(self): # This is the constructor of the class. It is called when an object of the class is created.
        self.vocab = {} #  This initializes an empty dictionary to store the mapping of tokens to their respective unique IDs.
        self.reverse_vocab = {} # This initializes an empty dictionary for the reverse mapping, from IDs back to tokens.

    def train(self, texts):
        """
        Stub for training the tokenizer on a list of texts.
        This method should be implemented by subclasses.
        """
        raise NotImplementedError("The 'train' method is not implemented.")

    def encode(self, text):
        """
        Stub for encoding a text string into a list of token ids.
        This method should be implemented by subclasses.
        """
        raise NotImplementedError("The 'encode' method is not implemented.")

    def decode(self, token_ids):
        """
        Stub for decoding a list of token ids back into a text string.
        This method should be implemented by subclasses.
        """
        raise NotImplementedError("The 'decode' method is not implemented.")

    def save(self, file_path):
        """
        Saves the tokenizer vocabulary to a file.
        """
        with open(file_path, 'w', encoding='utf-8') as f:
            json.dump(self.vocab, f, ensure_ascii=False, indent=4)

    def load(self, file_path):
        """
        Loads the tokenizer vocabulary from a file.
        """
        with open(file_path, 'r', encoding='utf-8') as f:
            self.vocab = json.load(f)
        self.reverse_vocab = {v: k for k, v in self.vocab.items()}

    def _add_token(self, token):
        """
        Utility function to add a token to the vocabulary.
        """
        if token not in self.vocab:
            index = len(self.vocab)
            self.vocab[token] = index
            self.reverse_vocab[index] = token

    def _token_to_id(self, token):
        """
        Utility function to get the id of a token.
        """
        return self.vocab.get(token, self.vocab.get('<unk>'))

    def _id_to_token(self, token_id):
        """
        Utility function to get the token corresponding to an id.
        """
        return self.reverse_vocab.get(token_id, '<unk>')
