import React, { useState } from 'react';
import { useQuery, useMutation } from '@apollo/react-hooks';
import gql from 'graphql-tag';

const GET_PRODUCTS = gql`
  query {
    products {
      id
      name
      description
      price
      stockLevel
    }
  }
`;

const ADD_PRODUCT = gql`
  mutation AddProduct(
    $name: String!
    $description: String!
    $price: Float!
    $stockLevel: Int!
  ) {
    addProduct(
      name: $name
      description: $description
      price: $price
      stockLevel: $stockLevel
    ) {
      id
      name
      description
      price
      stockLevel
    }
  }
`;

const UPDATE_PRODUCT = gql`
  mutation UpdateProduct(
    $id: ID!
    $name: String
    $description: String
    $price: Float
    $stockLevel: Int
  ) {
    updateProduct(
      id: $id
      name: $name
      description: $description
      price: $price
      stockLevel: $stockLevel
    ) {
      id
      name
      description
      price
      stockLevel
    }
  }
`;

function App() {
  const [name, setName] = useState('');
  const [description, setDescription] = useState('');
  const [price, setPrice] = useState(0);
  const [stockLevel, setStockLevel] = useState(0);
  const [addProduct] = useMutation(ADD_PRODUCT);
  const [updateProduct] = useMutation(UPDATE_PRODUCT);
  const { loading, error, data } = useQuery(GET_PRODUCTS);

  if (loading) return <p>Loading...</p>;
  if (error) return <p>Error :(</p>;

  const handleSubmit = (e) => {
    e.preventDefault();

    addProduct({
      variables: {
        name,
        description,
        price: parseFloat(price),
        stockLevel: parseInt(stockLevel),
      },
      refetchQueries: [{ query, GET_PRODUCTS }],
    });
    
    setName('');
    setDescription('');
    setPrice(0);
    setStockLevel(0);
};

const handleEdit = (product) => {
const { id, name, description, price, stockLevel } = product;
updateProduct({
    variables: {
      id,
      name,
      description,
      price: parseFloat(price),
      stockLevel: parseInt(stockLevel),
    },
    refetchQueries: [{ query: GET_PRODUCTS }],
  });
};

return (
<div>
<h1>Inventory Management</h1>
<h2>Add Product</h2>
<form onSubmit={handleSubmit}>
<label>
Name:
<input type="text" value={name} onChange={(e) => setName(e.target.value)} />
</label>
<label>
Description:
<input type="text" value={description} onChange={(e) => setDescription(e.target.value)} />
</label>
<label>
Price:
<input type="number" step="0.01" value={price} onChange={(e) => setPrice(e.target.value)} />
</label>
<label>
Stock Level:
<input type="number" value={stockLevel} onChange={(e) => setStockLevel(e.target.value)} />
</label>
<button type="submit">Add Product</button>
</form>
<h2>Products</h2>
<table>
<thead>
<tr>
<th>Name</th>
<th>Description</th>
<th>Price</th>
<th>Stock Level</th>
<th>Edit</th>
</tr>
</thead>
<tbody>
{data.products.map((product) => (
<tr key={product.id}>
<td>{product.name}</td>
<td>{product.description}</td>
<td>{product.price}</td>
<td>{product.stockLevel}</td>
<td><button onClick={() => handleEdit(product)}>Edit</button></td>
</tr>
))}
</tbody>
</table>
</div>
);
}

export default App;
