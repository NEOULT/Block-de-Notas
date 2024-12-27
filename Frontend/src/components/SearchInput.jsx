import styled from "styled-components";
import { useState } from "react";

const StyledInput = styled.input`
    padding: 14px;
    width: 100%;
    max-width: 450px;
    border-radius: 10px;
    border: 1px solid #ccc;
    box-sizing: border-box;

    @media (max-width: 768px) {
        padding: 12px;
        width: 90%;
        font-size: 14px;
    }

    @media (max-width: 480px) {
        padding: 10px;
        width: 85%;
        font-size: 12px;
    }
`;

const SearchInput = (props) => {

    const [term, setTerm] = useState("");

    function handleChange(e) {
        const { value } = e.target;
        setTerm(value);
        props.onSearch(value);
    }
    

    return (
        <StyledInput type="text" placeholder="Search..." value={term} onChange={handleChange}/>
    )
}

export default SearchInput;
