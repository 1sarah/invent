import React, { useState } from 'react';
import { useMutation } from '@apollo/client';
import { ADD_PRODUCT, GET_PRODUCTS } from '../queries';

function AddProductForm() {
  const [name, setName] = useState('');
  const [price, setPrice] = useState('');
  const [quantity, setQuantity] = useState('');

  const [addProduct] = useMutation(ADD_PRODUCT, {
    update(cache, { data: { addProduct } }) {
      const { products } = cache.readQuery({ query: GET_PRODUCTS });
      cache.writeQuery({
        query: GET_PRODUCTS,
        data: { products: products.concat([addProduct]) },
      });
    },
  });

  function handleSubmit(event) {
    event.preventDefault();
    addProduct({
      variables: { name, price: parseFloat(price), quantity: parseInt(quantity) },
    });
    setName('');
    setPrice('');
    setQuantity('');
  }

    return (
      <div>
        <h1>Add Product</h1>
        <form onSubmit={handleSubmit}>
          <label>
            Name:
            <input type="text" value={name} onChange={e => setName(e.target.value)} />
          </label>
          <label>
            Price:
            <input type="number" value={price} onChange={e => setPrice(e.target.value)} />
          </label>
          <label>
            Quantity:
            <input type="number" value={quantity} onChange={e => setQuantity(e.target.value)} />
          </label>
          <button type="submit">Add Product</button>
        </form>
      </div>
    );
   
}

export default AddProductForm;